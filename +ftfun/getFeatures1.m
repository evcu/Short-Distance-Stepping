function [ sub_out,ftrs ] = getFeatures1( sub )
%getFeatures1 This function gets a subject and calculates the following
%features for the subject and add these features as vector in the field
%'.features'
%1/2-ExtraRotationDone-Mean/Std
%3/4-StepRotation-Mean/Std                   
%5/6-StepLength-Mean/Std                  
%7/8-StartingStance-Width/AngleDeviation                 
%9/10-EndingStance-Width/AngleDeviation                  
%11/12-TotalStepPerDistance-Mean/Std        
%13/14-TotalStepPerAngleDiff-Mean/Std   
%TODO getBiases NEW FUNCTION!
%15/16-NetTurningDirectionBias   Forward/Backward  (Regs: *-3/7-7)
%17/18=NetStartingFootBias Forward/Backward        (Regs: *-3/7-3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fMatrix has the following fields
%1-TotalTurning
%2-TotalDistance
%3-TotalStep
%4-DirDifference Start-End
%5-DistDifference Start-End
%6-Stance-DistanceSpan-Beg
%7-Stance-AngleSpan-Beg
%8-Stance-DistanceSpan-End
%9-Stance-AngleSpan-End
%10-Forward
%11-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% difMatrix has the following fields
%1st row- Step distance vector
%2nd row= Step rotation vector.
m=size(sub,2);
fMatrix=zeros(9,m);
difMatrix=zeros(2,sum(cat(1,sub(1,:).totalSteps)));
iSteps=1;
for i=1:m
    seq=sub(1,i);
     n=seq.totalSteps;
    stepSeq=regtest.getStepOrder(seq);
    difr=zeros(2,n);
   difr(:, logical(stepSeq))=ftfun.getStepDiff(seq.RightSteps); %Returns 2xn matrix.
   difr(:, ~logical(stepSeq))=ftfun.getStepDiff(seq.LeftSteps);
   difMatrix(:,iSteps:iSteps+n-1)=difr;
   iSteps=iSteps+n;
   fMatrix(1,i)=sum(abs(difr(2,:)));
   fMatrix(2,i)=sum(abs(difr(1,:)));
   fMatrix(3,i)=n;
    fMatrix(4,i)=ftfun.getAngleDifference(90,seq.source(3),1);
    fMatrix(5,i)=ppro.getDistance(seq.source(1:2),[0 0]);

   startStanceR=seq.RightSteps(1,:);
    startStanceL=seq.LeftSteps(1,:);
    endStanceR=seq.RightSteps(end,:);
    endStanceL=seq.LeftSteps(end,:);
    fMatrix(6,i)=ppro.getDistance(startStanceR(1,1:2),startStanceL(1,1:2));
    fMatrix(7,i)=ftfun.getAngleDifference(startStanceR(1,3),startStanceL(1,3),1);
    fMatrix(8,i)=ppro.getDistance(endStanceR(1,1:2),endStanceL(1,1:2));
    fMatrix(9,i)=ftfun.getAngleDifference(endStanceR(1,3),endStanceL(1,3),1);
  
end
%1-ExtraTurningDone-Mean                        TotalTurning-DirDifference
%2-ExtraTurningDone-Varience
%3-4-StepTurningVariance-Mean                     difMatrix
%5-6-StepLengthVariance-Mean                    difMatrix
%7-8-StanceSpan-AngleMean/Start                 Stance-Span-Beg
%9-10-StanceSpan-AngleMean/End                   Stance-Span-End
%11-12-TotalStepPerDistance-Mean-Varience       DistDifference-TotalStep
%13-14-TotalStepPerDirectionDiff-Mean-Varience  DirDifference-TotalStep
ftrs=zeros(1,14);
f12=fMatrix(1,:)./2-fMatrix(4,:);
ftrs(1)=mean(f12);
ftrs(2)=std(f12);
ftrs(3)=mean(difMatrix(2,:));
ftrs(4)=std(difMatrix(2,:));
ftrs(5)=mean(difMatrix(1,:));
ftrs(6)=std(difMatrix(1,:));
ftrs(7)=mean(fMatrix(6,:));
ftrs(8)=mean(fMatrix(7,:));
ftrs(9)=mean(fMatrix(8,:));
ftrs(10)=mean(fMatrix(9,:));
ft1112=fMatrix(3,:)./fMatrix(5,:);
ftrs(11)=mean(ft1112);
ftrs(12)=std(ft1112);
ft1314=fMatrix(3,:)./fMatrix(4,:);
ftrs(13)=mean(ft1314);
ftrs(14)=std(ft1314);
sub_out=sub;
[sub_out.charFeatures]=deal(ftrs);
end

