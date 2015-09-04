function [ x, y ] = prepareData32( sub_indices,saveXY,dataNumber )
%prepareData3 It prepares input output matrices which are
%   x: 17xn
% 1:4-> RfootStart 5:8-> LfootStart 9:12-> strategy 13:14->Directness/TotalSteps  15:16->Stance-End 17-> RorL 
% Strategy is basicaly seqFeatures(1:4).
%   y: 4xn
% 1:4-> Nextstep  
% To calculate x vector and basically stance step locations it uses
% nnStance. Because the original function uses it and It is safer to create
% the data set by using it. 
addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
[cut_sub,~]=getseq.cutSequence(sub);
% sub=rtools.transformSubject(sub);
rstart=cat(1,cut_sub.rtFootStart)';
lstart=cat(1,cut_sub.ltFootStart)';
nextstep=cat(1,cut_sub.StepTarget)';
ftrs=cat(1,cut_sub.seqFeatures)';
biases=cat(2,cut_sub.charBias);
rorl=cat(1,cut_sub.RTorLT)';

x=[rstart;lstart;ftrs(1:4,:);ftrs(9:10,:);ftrs(7:8,:);rorl];
y=nextstep;

if saveXY
    save(sprintf('./xyData/dataNextStep2%d',dataNumber),'x','y');
end
end
