function [ out_sub ] = searchCleanSequences( sub,region,plot_on )
%serachCleanSequences This function is a vital investigation funtion. Given
%'sub' and the region of interest, function does the followings sequencially.
% 1) It decides the representation format of 'sub' input by looking the appropriate
% fields in the sequence struct
% 2) Then it searches along the sequences' target/source fields and finds the sequences
% within a region and then returns it.
% TODO Step 2 may include sorting according to the first step locations.
% 
% Input
% -sub: 1xm the output of detectStartingFrames(clean_sub) function. So the sequences has the following fields
%     seqNo
%     targetNo
%     subjNo
%     rTra
%     lTra
%     bdyTra
%     StopIndicesLeft
%     StopIndicesRight
%     LeftSteps
%     RightSteps
%     totalSteps
%     targetLoc
%     source
% -region: region is a struct with the following fields.
%    xpoly: x coordinates of the edges of polygon.
%    ypoly: y coordinates of the edges of polygon.
%     ang1 positive smaller angle of direction interval
%     ang2 positive larger angle of direction interval
% -plot_on: function plots the founded sequences one by one
if nargin==2
  plot_on=false;  
end
%Detecs the input representation.
if sub(1).targetLoc(3)==-1
    cofs=cat(1,sub(1,:).source); %Cofs for center of foot
elseif sub(1).source(3)==-1
    cofs=cat(1,sub(1,:).targetLoc);
else
    error('Hey I am a bug');
end
cofs(:,3)=mod(cofs(:,3),360);
pointsinterval=inpolygon(cofs(:,1),cofs(:,2),region.xpoly,region.ypoly);
angle_interval=cofs(:,3)>=region.ang1&cofs(:,3)<=region.ang2;
out_sub=sub(1,pointsinterval&angle_interval);
if plot_on
    for i=size(out_sub,2);
       anim.animateCleanSeq(out_sub(1,i)); 
    end
end
end

