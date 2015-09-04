function [ x, y ] = prepareData42( sub_indices,saveXY,dataNumber )
%prepareData4It prepares input output matrices which are
%   x: 8xm
% 1:4-> RfootStart 5:8-> LfootStart
%   y: 2xm one-hot 1.row->Rt 2.row->LT
%THIS WAS FOR TESTING HOW GOOD IS prepareData4 REPRESENTATION. IT LOOKS
%GOOD.

addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
m=size(sub,2);
x=zeros(8,m);
y=zeros(2,m);
for i=1:m
    seq=sub(i);
    src=rtools.ang2vec(seq.source)';
    sParam=seq.seqFeatures(5:6)';
    x_stance=[src;sParam];
    x(:,i)=nnfun.nnStance1(x_stance);
    stepOrder=regtest.getStepOrder(seq);
    if stepOrder(1)
       y(1,i)=1; 
    else
       y(2,i)=1; 
    end
    
end

if saveXY
    save(sprintf('./xyData/dataFirstStep%d',dataNumber),'x','y');
end
end
