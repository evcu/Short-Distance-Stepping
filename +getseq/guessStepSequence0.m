function gSeq=guessStepSequence0(x,fixedSampling)
%guessStepSequence given the first stance this function calculates the
%whole stepping sequence by consequetively calling the nnNextStep function
%The output is explained in generateSteps function. Let me copy it also
%here
% Output:
% gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance.
% gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n+1)x4
%The stance
STEP_LIMIT=9; %That is what observed in data and we need this constraint for stacked trajectory guessing
load('./+tra/const.mat');
gSeq.steps(1,:)=rtools.vec2ang(x(1:4)');  %%THAT IS AN IMPORTANT POINT
gSeq.steps(2,:)=rtools.vec2ang(x(5:8)');
for i=3:STEP_LIMIT
    steppingFoot=x(end);
    y=nnfun.nnNextStep(x);
    if getseq.isStationary(x,y,steppingFoot)
        break;
    end
    gSeq.steps(i,:)=rtools.vec2ang(y');
    gSeq.stepOrder(i-2)=logical(steppingFoot);
    x_new=rtools.ang2vec(gSeq.steps(i,:))'; %This is for normalizing the direction vector
    if steppingFoot %1 is for RT
        x(1:4)=x_new;
    else
        x(5:8)=x_new;
    end
    x(end)=~x(end);
end
if fixedSampling
    [gSeq.bTra,gSeq.rTra,gSeq.lTra]=tra.getTrajectories(gSeq);
else
    [gSeq.bTra,gSeq.rTra,gSeq.lTra]=tra.getTrajectories0(gSeq);
end
end

