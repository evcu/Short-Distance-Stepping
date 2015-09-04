function [ x, y ] = prepareDataFootTra( sub_indices,saveXY,dataNumber )
%x->   4*10 (STACK_PER_FOOT(5) for RT, STACK_PER_FOOT(5) for LT); 41:RTorLT (I am not sure whether this is
%needed. 
%Most step sequence is 7, so the number 5 is selected so.
%y->    1:4*TRAJECTORY_LENGTH    : bodyTrajectory
%PROBLEM-This dataset is almost perfetly learnable with [600 300] hidden
%with 300 repetitions. However there is no time information so this data is
%not going to be used.
STACK_PER_FOOT=5;
FRAME_PER_STEP=8;
addpath('./dnew/')
if nargin==1
    saveXY=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end

sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
m=size(sub,2);
x=zeros(STACK_PER_FOOT*8+4,m);
y=zeros((FRAME_PER_STEP*(STACK_PER_FOOT-1)+1)*8,m);
for i=1:m
    seq=sub(i);
    x(:,i)=tra.stackSteps(seq.RightSteps,seq.LeftSteps,seq.StopIndicesLeft(1)>seq.StopIndicesRight(1),STACK_PER_FOOT); %3rd argument is basically isRT logical.
    sampledRT=tra.sampleTrajectory2(seq.rTra,FRAME_PER_STEP,STACK_PER_FOOT-1,double(seq.StopIndicesRight),1); 
    sampledLT=tra.sampleTrajectory2(seq.lTra,FRAME_PER_STEP,STACK_PER_FOOT-1,double(seq.StopIndicesLeft),1); 
    y(:,i)=[sampledRT;sampledLT];
end

if saveXY
    save(sprintf('./xyData/dataFeetTra%d',dataNumber),'x','y');
    save('./+tra/constFoot','STACK_PER_FOOT','FRAME_PER_STEP');
end
end
