function [ x, y ] = prepareData5( sub_indices,saveXY,dataNumber )
%%prepareData5 This function prepares the data ready for strategy guessing
%%NN. Input is the stance information whereas the output is the 6 strategy
%%which are features(1:4) and features(9:10)
%   x: 8xm
% 1:4-> RfootStart 5:8-> LfootStart
%   y: 6xm 
%1-ExtraRotationDone
%2-ExtraDistanceTaken
%3-StepRotation-Mean
%4-StepLength
%5 Directness -> is the ratio of the distance taken in the first step to
%the overall distance taken by that foot. Between 0-1
%6 totalSteps;
%TODO implement totalSteps as one hot binary maybe?

addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
m=size(sub,2);
x=zeros(8,m);
y=zeros(6,m);
for i=1:m
    seq=sub(i);
    src=rtools.ang2vec(seq.source)';
    sParam=seq.seqFeatures(5:6)';
    x_stance=[src;sParam];
    xsteps=nnfun.nnStance1(x_stance);
    x(:,i)=xsteps;
    y(:,i)=[seq.seqFeatures(1:4)';seq.seqFeatures(9:10)'];
    
end

if saveXY
    save(sprintf('./xyData/dataCharStruct%d',dataNumber),'x','y');
end
end
