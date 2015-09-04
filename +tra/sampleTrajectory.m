function [ y ] = sampleTrajectory(bdyTra,TRAJECTORY_LENGTH,stopIndices,isVector)
%sampleTrajectory This function samples the body trajectory
% bdyTra: mx3 matrix.
%TRAJECTORY_LENGTH: const
%stopIndices: 1xn [seq.StopIndicesRight seq.StopIndicesLeft]
%isVector: 0->return vector, 1->return matrix
% y=TRAJECTORY_LENGTH*4x1 vector;
indices=floor(linspace(min(stopIndices),max(stopIndices),TRAJECTORY_LENGTH));
% axis([-0.6 0.6 -0.6 0.6]);
% hold on;
% anim.animateTrajectory(bdyTra(indices,:),'r',25);
% clf
if isVector
y=reshape(rtools.ang2vec(bdyTra(indices,:)),TRAJECTORY_LENGTH*4,1);
else
y=bdyTra(indices,:);    
end
end

