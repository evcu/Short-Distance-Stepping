function [ out ] = getSubTrajectory(traj,indices,numberOfSamples)
%getSubTrajectory This function gets a trajectory, two index and number of samples as input
%and returns sampled trajectory between indices.
% traj->nxm matrix n->number of data points m->Data point dim, usully 3
% indices(1)-> i_start indices(2)->i_end
% numberOfSamples-> m
% NOT USED RIGHT NOW
%%%%%%%%%%%%%%%%%%%%%%%%%
%Output: 1x(k*m) vector
indices=double(indices);
for i=size(indices,1):-1:1
samplei=int64(linspace(indices(i,1),indices(i,2),numberOfSamples));
matrx=traj(samplei,:);
out(i,:)=reshape(matrx',1,numel(matrx));  
end

end

