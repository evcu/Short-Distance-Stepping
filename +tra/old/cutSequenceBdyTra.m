function [ cut_stances ] = cutSequenceBdyTra( sub )
%cutSequence2 This function gets a sequence array as 'sub' and then
%iterates over the each sequence to seperate it into the one step pieces. 
%It basically prepares the x-y data for each cut-sequence
%x_seq->    1:4-pastRightFoot  5:8-pastLeftFoot  9:12-currentRightFoot
%           13-16-currentLeftFoot
%y_Seq->    1:4-bodyTrajectory 5:6-tangentDirection

for i=length(sub):-1:1
   seq=sub(i);
   dTraj=diff(seq.bdyTra);
   tangents=rtools.ang2vec(rtools.vec2ang(repmat(dTraj(:,1:2),1,2)));
   tangents=tangents(:,3:4);
   trajWithTangent=[rtools.ang2vec(seq.bdyTra(2:end,:)) tangents];
   rs=rtools.ang2vec(seq.RightSteps);
   ls=rtools.ang2vec(seq.LeftSteps);
   stepOrder=regtest.getStepOrder(seq);
   n=length(stepOrder);
   steps=zeros(n+2,4);
   sindices=zeros(n+2,1);
   assert(~isempty(stepOrder),'Hey, It''s me bug');
   if stepOrder(1)
      rs_indices=logical([1 0 stepOrder]);
   else
      rs_indices=logical([0 1 stepOrder]); 
   end
   steps(rs_indices,:)=rs;
   steps(~rs_indices,:)=ls;
   sindices(rs_indices)=seq.StopIndicesRight;
   sindices(~rs_indices)=seq.StopIndicesLeft;
   sindices(2)=[];
   pastr=zeros(n+1,4);
   pastl=zeros(n+1,4);
   nowr=zeros(n+1,4);
   nowl=zeros(n+1,4);
    for j=1:n+1
       if j==1
               pastr(j,:)=rs(1,:);
               pastl(j,:)=ls(1,:);
               nowr(j,:)=rs(1,:);
               nowl(j,:)=ls(1,:);
       else
           if stepOrder(j-1)
               pastr(j,:)=steps(j-1,:);
               pastl(j,:)=steps(j,:);
               nowr(j,:)=steps(j+1,:);
               nowl(j,:)=steps(j,:); 
           else
               pastl(j,:)=steps(j-1,:);
               pastr(j,:)=steps(j,:);
               nowl(j,:)=steps(j+1,:);
               nowr(j,:)=steps(j,:); 
           end
       end
    end
    cut_stances(i).y_seq=trajWithTangent(sindices,:);
  cut_stances(i).x_seq=[pastr pastr nowr nowl];
end
end
