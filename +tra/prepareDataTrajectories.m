function [ x, y ] = prepareDataTrajectories( sub_indices,TRAJECTORY_LENGTH,RtLtBdy,saveXY,dataNumber )
%x->   4*10+1+3
% 40->(STACK_PER_FOOT(5) for RT+STACK_PER_FOOT(5) for LT=10);  %Most step sequence is 7, so the number 5 is selected so.
% 41:RTorLT 
% 42:44->totalSteps as binary input
%y->    1:4*TRAJECTORY_LENGTH    : bodyTrajectory
STACK_PER_FOOT=5;
addpath('./dnew/')
if nargin<4
    saveXY=false;%Default Speed Value
elseif nargin==4
    dataNumber=0;
end
if isnumeric(sub_indices)
  sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);  
else
  display('Hey. You saved some time. Congrats!');
  sub=sub_indices;
end
switch RtLtBdy
    case -1
       traj='seq.bdyTra' ;
       save_name=sprintf('./xyData/dataTraBdy%d',dataNumber);
    case 0 
        traj='seq.lTra' ;
        save_name=sprintf('./xyData/dataTraLT%d',dataNumber);
    case 1
        traj='seq.rTra' ;
        save_name=sprintf('./xyData/dataTraRT%d',dataNumber);
    otherwise
        tra.prepareDataTrajectories( sub,TRAJECTORY_LENGTH,-1,saveXY,dataNumber );
        tra.prepareDataTrajectories( sub,TRAJECTORY_LENGTH,0,saveXY,dataNumber );
        tra.prepareDataTrajectories( sub,TRAJECTORY_LENGTH,1,saveXY,dataNumber );
        save('./+tra/const','STACK_PER_FOOT','TRAJECTORY_LENGTH');
        getseq.createGseqFromData(sub,1)
        return;
end
m=size(sub,2);
x=zeros(STACK_PER_FOOT*8+4,m); %+1 is for isRT +3 for binary total steps
y=zeros(4*TRAJECTORY_LENGTH,m);
for i=1:m
    seq=sub(i);
    x(:,i)=tra.stackSteps(seq.RightSteps,seq.LeftSteps,seq.StopIndicesLeft(1)>seq.StopIndicesRight(1),STACK_PER_FOOT); %3rd argument is basically isRT logical.
    y(:,i)=tra.sampleTrajectory(eval(traj),TRAJECTORY_LENGTH,double([seq.StopIndicesRight seq.StopIndicesLeft]),1); 
end

if saveXY
    save(save_name,'x','y');
end
end
