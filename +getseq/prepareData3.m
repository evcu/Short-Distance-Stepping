function [ x, y ] = prepareData3( sub_indices,saveXY,dataNumber )
%prepareData3 It prepares input output matrices which are
%   x: 13xn
% 1:4-> RfootStart 5:8-> LfootStart 9:12-> strategyn13-> RorL 
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
%biases=cat(1,cut_sub.charBias)';
rorl=cat(1,cut_sub.RTorLT)';

x=[rstart;lstart;ftrs(1:4,:);rorl];
y=nextstep;

if saveXY
    save(sprintf('./xyData/dataNextStep%d',dataNumber),'x','y');
end
end
