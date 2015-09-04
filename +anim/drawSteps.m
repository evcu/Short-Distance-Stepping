function  drawSteps( seq )
%drawSteps Draws the step locations with direction
%   Detailed explanation goes here
%         rsteps=seq.StopIndicesRight
%         lsteps=seq.StopIndicesLeft
[rsteps, lsteps]=ppro.getStepIndices(seq);
 fprintf('Right Steps at: %s\n', sprintf('%d ', rsteps));
 fprintf('Left Steps at: %s\n', sprintf('%d ', lsteps));
if rsteps(1)>lsteps(1)
    isWrong=isItWrong(lsteps,rsteps);
else
    isWrong=isItWrong(rsteps,lsteps);
end
if isWrong
   fprintf('There is a problem at stepping sequence\n'); 
end
for i=1:size(rsteps,2)
    anim.drawDestination(double(seq.rTra(rsteps(i),:)),'r'); 
end

for i=1:size(lsteps,2)
    anim.drawDestination(double(seq.lTra(lsteps(i),:)),'b'); 
end
end

function isWrong=isItWrong(leadingFoot,trailingFoot)
isWrong=0;
    if (length(trailingFoot)>length(leadingFoot))||(length(leadingFoot)-length(trailingFoot)>1)
       isWrong=1;  
    elseif (length(leadingFoot)-length(trailingFoot))==1
       if leadingFoot(end)<trailingFoot(end)
          isWrong=1; 
       end
    elseif sum((trailingFoot-leadingFoot(1:length(trailingFoot)))<0)~=0
       isWrong=1; 
    end  
end


% distr=getStepDistances(rf,rsteps)
% distl= getStepDistances(lf,lsteps)