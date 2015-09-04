function [ dists ] = getStepDistances( seq,indices )
%getStepDistances Given sequences and step indices calculates the
%euclidian distance vector.
for i=1:size(indices,2)-1
    dists(i)= ppro.getDistance(seq(indices(i),1:2), seq(indices(i+1),1:2));
end
end

