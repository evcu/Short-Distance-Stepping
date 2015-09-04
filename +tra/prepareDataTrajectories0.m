function [ x, y ] = prepareDataTrajectories0( sub_indices,SAMPLING_PERIOD_NEW,RtLtBdy,i2ignore,saveXY,dataNumber )
%prepareDataTrajectories0 prepares data for fixed timed trajectory sampling
%preprocessing.
%sub_indices->Indicates the subject numbers to be included 8:20.
%SAMPLING_PERIOD->Every sampling period the trajectory is sampled by one.
%RtLtBdy-> indicates the trajectory type to be sampled. -1-bdy,0-lt,1-rt,
%otherwise ALL
%saveXY(optional->Boolean : Default:0
%dataNumber (to indicate the saving name data-set number
%i2ignore: are the indices of the big subject matrix loaded. The indices in
%i2ignore are not loaded.
%To begin always use RtLtBdy=2 to initiliaze and save the variables right.

if nargin<4
    i2ignore=[];
end
if nargin<5
    saveXY=false;%Default Speed Value
end
if nargin<6
    dataNumber=0;
end
if isnumeric(sub_indices)
    sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices,i2ignore);
else
    display('Hey. You saved some time. Congrats!');
    sub=sub_indices;
end
m=size(sub,2);
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
        load('./+tra/const');
        SAMPLING_PERIOD=SAMPLING_PERIOD_NEW;
        tra_length=zeros(1,m);
        for i=1:size(sub,2)
            b=[sub(i).StopIndicesRight sub(i).StopIndicesLeft];
            tra_length(i)=max(b)-min(b);
        end
        STACK_PER_TRAJECTORY=ceil(max(tra_length)/SAMPLING_PERIOD);
        save('./+tra/const','STACK_PER_FOOT','TRAJECTORY_LENGTH','SAMPLING_PERIOD','STACK_PER_TRAJECTORY');
        tra.prepareDataTrajectories0( sub,SAMPLING_PERIOD,-1,i2ignore,saveXY,dataNumber );
        tra.prepareDataTrajectories0( sub,SAMPLING_PERIOD,0,i2ignore,saveXY,dataNumber );
        tra.prepareDataTrajectories0( sub,SAMPLING_PERIOD,1,i2ignore,saveXY,dataNumber );
        getseq.createGseqFromData0(sub,i2ignore,1)
        return;
end
load('./+tra/const');
assert(exist('STACK_PER_TRAJECTORY','var')&&exist('SAMPLING_PERIOD','var')&&exist('STACK_PER_FOOT','var'),'Load failed');
addpath('./dnew/')
x=zeros(STACK_PER_FOOT*8+4,m); %+1 is for isRT +3 for binary total steps
y=zeros(STACK_PER_TRAJECTORY*4,m);
for i=1:m
    seq=sub(i);
    x(:,i)=tra.stackSteps(seq.RightSteps,seq.LeftSteps,seq.StopIndicesLeft(1)>seq.StopIndicesRight(1),STACK_PER_FOOT); %3rd argument is basically isRT logical.
    y(:,i)=tra.sampleTrajectory0(eval(traj),SAMPLING_PERIOD,STACK_PER_TRAJECTORY,[seq.StopIndicesLeft seq.StopIndicesRight],1);
end
if saveXY
    save(save_name,'x','y');
end
end
