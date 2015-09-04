function [ x, y ] = prepareDataBodyTra2( sub_indices,saveXY,dataNumber )
%prepareDataBodyTra2 It prepares input output matrices which are
%x 14x1 ->    1:4-rtFoot  5:8-lfFoot  9:12-NextStep 13-isRT 14-isStart
%y 4xm  ->    Each one is a consequtive trajectory in the sequence.m is the sampling freq  
% the data set by using it. 
addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
cut_sub=tra.cutSequenceBdyTra2(sub);
x=cat(1,cut_sub.x_seq)';
y=cat(1,cut_sub.y_seq)';

if saveXY
    save(sprintf('./xyData/dataBdyTra2%d',dataNumber),'x','y');
end
end
