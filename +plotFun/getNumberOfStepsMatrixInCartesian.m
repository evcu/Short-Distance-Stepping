function [ out ] = getNumberOfStepsMatrixInCartesian( sub )
%getNumberOfStepsMatrix The function gets processed subject, which is a vector of sequenec structs which
%have the following fields
%   seqNo: int
%   targetNo: int
%   subjNo: int
%   rTra: [nx3 double]
%   lTra: [nx3 double]
%   bdyTra: [nx3 double]
%   StopIndicesLeft: 1xl
%   StopIndicesRight: 1xr
%   LeftSteps: [lx3 double]
%   RightSteps: [rx3 double]
%   totalSteps: l+r-2
%   source: 1x3
%   targetLoc: 1x3 (After transform)
%   Left foot-->Blue
%   Right foot-->Red
%This function calculates the variables alpha,gama,distance and number of
%steps for each sequence and returns them in 4xn matrix where n is the
%#sequences in the subject array.
%alpha= is the target point direction with respect to the 90 degree source.
%gama=change in orientation.
%TODO=one can get distance alpha from cart2pol function. So it may simplfy
%the code.
out=zeros(size(sub,2),4);
  for i=1:size(sub,2)     
        seq=sub(i);
        target=seq.targetLoc;        
        assert(target(3)<180&&target(3)>-180,'Error. Fix here');
        gama=90-target(3); 
        if gama>180  %For having gama [-180,180] 
            gama=gama-360;
        end     
        out(i,1)=target(1);
        out(i,2)=target(2);
        out(i,3)=-gama; %I did the otherway positive is cw. negative ccw.
        out(i,4)=seq.totalSteps;
  end
end

