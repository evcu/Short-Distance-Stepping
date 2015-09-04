function [ sub_out,all_ftrs ] = getFeatures2( sub )
%getFeatures1 This function gets a subject and calculates the following
%features for the subject and add these features as vector in the field
%'.features'
%1-ExtraRotationDone
%2-ExtraDistanceTaken
%3-StepRotation-Mean
%4-StepLength
%5/6-StartingStance-Width/AngleDeviation
%7/8-EndingStance-Width/AngleDeviation
%9 Directness -> is the ratio of the distance taken in the first step to
%the overall distance taken by that foot. Between 0-1
%10 totalSteps;
%NEW1! The only difference from getFeatures1 is this one calculates the
%feature for each sequence instead of taking the mean of all sequences of a
%subject
%NEW2! Deleted TotalStepPer* fields, because they are equal to
%1/StepRotation.
TOTAL_FEATURES=10;
sub_out=sub;
m=size(sub,2);
all_ftrs=zeros(m,TOTAL_FEATURES);
for i=1:m
    seq=ftfun.checkStepAngles(sub(1,i));
    
    n=seq.totalSteps;
    stepSeq=regtest.getStepOrder(seq);
    difr=zeros(2,n);
    difr(:, logical(stepSeq))=ftfun.getStepDiff(seq.RightSteps); %Returns 2xn matrix.
    difr(:, ~logical(stepSeq))=ftfun.getStepDiff(seq.LeftSteps); % 1.row->Length 2.row->Rotation
    
    totalTurning=sum(abs(difr(2,:)));
    totalDistance=sum(abs(difr(1,:)));
    DirDifference=ftfun.getAngleDifference(90,seq.source(3),1);
    DistDifference=ppro.getDistance(seq.source(1:2),[0 0]);
    %1-ExtraRotationDone
    %2-ExtraDistanceTaken
    %3-AvgStepRotation
    %4-AvgStepLength
    %5/6-StartingStance-Width/AngleDeviation
    %7/8-EndingStance-Width/AngleDeviation
    ftrs=zeros(1,8);
    ftrs(1)=(totalTurning/2-DirDifference);
    ftrs(2)=(totalDistance/2-DistDifference);
    ftrs(3)=totalTurning/n;
    ftrs(4)=totalDistance/n;
    %What about giving these variables directly so total 5: -totalTurning
    %-totalDistance -DirDifference -DistDifference -n
    startStanceR=seq.RightSteps(1,:);
    startStanceL=seq.LeftSteps(1,:);
    endStanceR=seq.RightSteps(end,:);
    endStanceL=seq.LeftSteps(end,:);
    ftrs(5)=ppro.getDistance(startStanceR(1,1:2),startStanceL(1,1:2));
    ftrs(6)=ftfun.getAngleDifference(startStanceR(1,3),startStanceL(1,3),1);
    ftrs(7)=ppro.getDistance(endStanceR(1,1:2),endStanceL(1,1:2));
    ftrs(8)=ftfun.getAngleDifference(endStanceR(1,3),endStanceL(1,3),1);
    ftrs(9)=difr(1,1)/sum(difr(1,1:2:end));  %Directenss
    ftrs(10)=n>3; %Total number of steps;
    sub_out(i).seqFeatures=ftrs;
    all_ftrs(i,:)=ftrs;
end
end

