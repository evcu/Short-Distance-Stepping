function [ subFinal ] = cleanAndTransform( sub_indices,cleanTheDataNow )
%cleanAll Summary of this function goes here
%   Detailed explanation goes here
if nargin==1
    cleanTheDataNow=false;
end
addpath('./dnew/')
subFinal=[];
if cleanTheDataNow;
    cleanAndSave(subindices);
end
sub=ppro2.loadAndMergeSubjects(sub_indices);
sub=ppro.detectSteps(sub);
[sub , ~]=ppro.detectStartingFrames(sub);
sub=rtools.transformSubject(sub);
[subFinal, ~]=ppro.filterAdjustmentSteps(sub);
end


