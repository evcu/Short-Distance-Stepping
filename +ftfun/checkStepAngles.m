function [ seq_out ] = checkStepAngles( seq )
%checkAngles This funtion check the angles of the steps and then be sure
%that it is in the interval [-180,180]
p=size(seq.RightSteps,1);
stepsrl=[seq.RightSteps(:,3);seq.LeftSteps(:,3)];
a=mod(stepsrl,360);
a(a>180)=a(a>180)-360;
seq_out=seq;
seq_out.RightSteps(:,3)=a(1:p);
seq_out.LeftSteps(:,3)=a(p+1:end);
end

