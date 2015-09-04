function [ cut_stances ] = cutSequenceBdyTra2( sub )
%cutSequence2 This function gets a sequence array as 'sub' and then
%iterates over the each sequence to seperate it into the one step pieces. 
%It basically prepares the x-y data for each cut-sequence
%x_seq 14x1 ->    1:4-rtFoot  5:8-lfFoot  9:12-NextStep 13-isRT 14-isStart
%y_seq 4xm  ->    Each one is a consequtive trajectory in the sequence.m is the sampling freq  
% the data set by using it. 
    SAMPLING_FREQ=10;
    m=SAMPLING_FREQ;
for i=length(sub):-1:1
   seq=sub(i);
   rs=rtools.ang2vec(seq.RightSteps);
   ls=rtools.ang2vec(seq.LeftSteps);
   stepOrder=regtest.getStepOrder(seq);
   n=length(stepOrder);
   steps=zeros(n+2,4);

   assert(~isempty(stepOrder),'Hey, It''s me bug');
   if stepOrder(1)
      rs_indices=logical([1 0 stepOrder]);
   else
      rs_indices=logical([0 1 stepOrder]); 
   end
   steps(rs_indices,:)=rs;
   steps(~rs_indices,:)=ls;
   sindices=[];
   sindices(rs_indices)=seq.StopIndicesRight;
   sindices(~rs_indices)=seq.StopIndicesLeft;
   sindices(2)=[];
   sindices(1)=1;
   rtltnextFoot=zeros(n,12);
   isRT=zeros(n,1);
   isStart=zeros(n,1);
   isStart(1)=1;
   bTra=zeros(n,m*4);
   for j=1:n
   rtltnextFoot(j,:)=[steps(j,:) steps(j+1,:) steps(j+2,:)];
   isRT(j,1)=stepOrder(j);
   bTra(j,:)=tra.getSubTrajectory(rtools.ang2vec(seq.bdyTra),sindices(j:j+1),m);
   end
    cut_stances(i).y_seq=bTra;
  cut_stances(i).x_seq=[rtltnextFoot isRT isStart];
end
end
