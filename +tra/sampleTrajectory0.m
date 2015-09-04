function [ y ] = sampleTrajectory0(trajectory,SAMPLING_PERIOD,STACK_PER_TRAJECTORY,stopIndices,isVector)
%sampleTrajectory This function samples the body trajectory
% bdyTra: mx3 matrix.
%TRAJECTORY_LENGTH: const
%stopIndices: 1xn [seq.StopIndicesRight seq.StopIndicesLeft]
%isVector: 0->return vector, 1->return matrix
% y=TRAJECTORY_LENGTH*4x1 vector;
sampler=min(stopIndices):SAMPLING_PERIOD:max(stopIndices);
filled_stacks=length(sampler);
y=zeros(STACK_PER_TRAJECTORY,3);
y(1:filled_stacks,:)=trajectory(sampler,:);
y(filled_stacks+1:end,:)=repmat(y(filled_stacks,:),STACK_PER_TRAJECTORY-filled_stacks,1);
if isVector
y=reshape(rtools.ang2vec(y)',STACK_PER_TRAJECTORY*4,1);
else
  
end
end
