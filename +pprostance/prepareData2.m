function [ x, y ] = prepareData2( sub_indices,saveXY,dataNumber )
%prepareData1 It prepares input output matrices which are
%   x: 6xn
% 1:4-> Source 5,6-> stanceFeatures
%   y: 8xn
% 1:4-> Rfoot  5:8-> Lfoot 
addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
% sub=rtools.transformSubject(sub);
srcs=rtools.ang2vec(cat(1,sub.source))';
rfun=@(n) (arrayfun(@(x) x.RightSteps(1,n),sub)); %Gets the starting foots.
lfun=@(n) (arrayfun(@(x) x.LeftSteps(1,n),sub));
ftrfun=@(n) (arrayfun(@(x) x.seqFeatures(n),sub)); %ftr is for feature
rfeet=rtools.ang2vec([rfun(1);rfun(2);rfun(3)]')';
lfeet=rtools.ang2vec([lfun(1);lfun(2);lfun(3)]')';

sParam=[ftrfun(5);ftrfun(6)]; %s for stance
x=[srcs;sParam];
y=[rfeet;lfeet];

if saveXY
    save(sprintf('./xyData/dataStance%d',dataNumber),'x','y');
end
%out=getNumberOfStepsMatrixInCartesian(subFinal);
end

