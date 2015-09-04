function [ x, y ] = prepareData4( sub_indices,saveXY,dataNumber )
%prepareData4It prepares input output matrices which are
%   x: 12xm
% 1:4-> RfootStart 5:8-> LfootStart 9:12-> bias 
%   y: 2xm one-hot 1.row->Rt 2.row->LT

addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
m=size(sub,2);
x=zeros(12,m);
y=zeros(2,m);
for i=1:m
    seq=sub(i);
    src=rtools.ang2vec(seq.source)';
    sParam=seq.seqFeatures(5:6)';
    x_stance=[src;sParam];
    xsteps=nnfun.nnStance1(x_stance);
    x(:,i)=[xsteps;seq.charBias];
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
