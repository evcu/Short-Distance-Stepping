function [ out_frames,start_frames ] = cutSequence( sub )
%cutSequence This function gets a sequence as input 'sub'.
%The function cuts the sequences and transform them, such that they include
%the parameters required for learning.The parameters are
%Left Foot-Right Foot with (alpha,distance,gama)
%sub=1*n sequence array
%     rtFootStart: 1x4
%     ltFootStart: 1x4
%     RTorLT: 0-->LT, 1-->RT
%     Traj: 100x4 double
%     StepTarget: 1x4
%UPDATE:I've included bias and seqFeauteres of the sequences into the cuts.
%NOTE for trajectory: Since I am using the result of the nnStance as starting
%point, the trajectory of first two steps are problematic!
NORMALIZED_FRAME_LENGTH=100;
k=1;
k2=1;
for i=1:size(sub,2)
    seq=sub(i);
    src=rtools.ang2vec(seq.source)';
    sParam=seq.seqFeatures(5:6)';
    x_stance=[src;sParam];
    x=nnfun.nnStance1(x_stance);
    seq.RightSteps(1,:)=rtools.vec2ang(x(1:4)'); %This makes the auto-normalizing the angle to unit vector.
    seq.LeftSteps(1,:)=rtools.vec2ang(x(5:8)');
    for j=1:seq.totalSteps
        fr.isEnd=0;
        fr.rtFootStart=rtools.ang2vec(seq.RightSteps(1,:));
        fr.ltFootStart=rtools.ang2vec(seq.LeftSteps(1,:));
        if size(seq.StopIndicesRight,2)~=1&&size(seq.StopIndicesLeft,2)~=1
            if seq.StopIndicesRight(2)<seq.StopIndicesLeft(2)
                fr.RTorLT=1;
                sampling_indices=floor(linspace(double(seq.StopIndicesRight(1)),double(seq.StopIndicesRight(2)),NORMALIZED_FRAME_LENGTH));
                fr.Traj=rtools.ang2vec(seq.rTra(sampling_indices,:));
                fr.StepTarget=rtools.ang2vec(seq.RightSteps(2,:));
                seq.StopIndicesRight=seq.StopIndicesRight(2:end);
                seq.RightSteps=seq.RightSteps(2:end,:);
            else
                fr.RTorLT=0;
                sampling_indices=floor(linspace(double(seq.StopIndicesLeft(1)),double(seq.StopIndicesLeft(2)),NORMALIZED_FRAME_LENGTH));
                fr.Traj=rtools.ang2vec(seq.lTra(sampling_indices,:));
                fr.StepTarget=rtools.ang2vec(seq.LeftSteps(2,:));
                seq.StopIndicesLeft=seq.StopIndicesLeft(2:end);
                seq.LeftSteps=seq.LeftSteps(2:end,:);
            end
        else
            if size(seq.StopIndicesRight,2)==1
                fr.RTorLT=0;
                sampling_indices=floor(linspace(double(seq.StopIndicesLeft(1)),double(seq.StopIndicesLeft(2)),NORMALIZED_FRAME_LENGTH));
                fr.Traj=rtools.ang2vec(seq.lTra(sampling_indices,:));
                fr.StepTarget=rtools.ang2vec(seq.LeftSteps(2,:));
                seq.StopIndicesLeft=seq.StopIndicesLeft(2:end);
                seq.LeftSteps=seq.LeftSteps(2:end,:);
            else
                fr.RTorLT=1;
                sampling_indices=floor(linspace(double(seq.StopIndicesRight(1)),double(seq.StopIndicesRight(2)),NORMALIZED_FRAME_LENGTH));
                fr.Traj=rtools.ang2vec(seq.rTra(sampling_indices,:));
                fr.StepTarget=rtools.ang2vec(seq.RightSteps(2,:));
                seq.StopIndicesRight=seq.StopIndicesRight(2:end);
                seq.RightSteps=seq.RightSteps(2:end,:);
            end
        end
        
        %Add the stop frame also
        fr.charBias=seq.charBias;
        fr.seqFeatures=seq.seqFeatures;
        if j==1
            fr.isStart=1;
            start_frames(k2)=fr;
            k2=k2+1;
        else
            fr.isStart=0;
        end
        out_frames(k)=fr;
        k=k+1;
    end
    %Adds a stopping frame to the data-set.!!!Important.
    fr.rtFootStart=rtools.ang2vec(seq.RightSteps(1,:));
    fr.ltFootStart=rtools.ang2vec(seq.LeftSteps(1,:));
    fr.isEnd=1;
    fr.isStart=0;
    fr.RTorLT=~out_frames(k-1).RTorLT;
    if fr.RTorLT
        fr.StepTarget=rtools.ang2vec(seq.RightSteps(1,:));
    else
        fr.StepTarget=rtools.ang2vec(seq.LeftSteps(1,:));
    end
    fr.Traj=rtools.ang2vec(repmat(fr.StepTarget,NORMALIZED_FRAME_LENGTH,1));
    fr.charBias=seq.charBias;
    fr.seqFeatures=seq.seqFeatures;
    out_frames(k)=fr;
    k=k+1;
end
end

