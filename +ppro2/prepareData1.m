function [ x, y ] = prepareData1( sub_indices,saveXY,dataNumber )
%prepareData1 It prepares input output matrices which are
%   x: 7xn
%   y: 3xn
addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=floor(rand()*100);
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
[frames,~]=ppro2.cutAndFixFrames(sub);
[x, y]=ppro2.getMatrices1(frames);

if saveXY
    save(sprintf('./xyData/data%d',dataNumber),'x','y');
end
%out=getNumberOfStepsMatrixInCartesian(subFinal);
end

