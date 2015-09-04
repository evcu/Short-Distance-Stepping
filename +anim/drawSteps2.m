function  drawSteps2( seq,limit,drawFirstSteps )
%drawSteps2 Draws the first 'limit' step locations with direction and the step number.
%  
%         rsteps=seq.StopIndicesRight
%         lsteps=seq.StopIndicesLeft
lsteps=seq.LeftSteps;
rsteps=seq.RightSteps; 
% fprintf('Right Steps at: %s\n', sprintf('%d ', rsteps));
step_order=regtest.getStepOrder(seq);
if nargin==1
   limit=length(step_order);
   drawFirstSteps=true;
end
if nargin==2
   drawFirstSteps=true;
end
if drawFirstSteps
    anim.drawDestination2(rsteps(1,:),0,'r');
    anim.drawDestination2(lsteps(1,:),0,'b');
end
rno=2; %To start with step not stance
lno=2;
for i=1:length(step_order)
    if step_order(i)
       anim.drawDestination2(rsteps(rno,:),i,'r');
       rno=rno+1;
    else
       anim.drawDestination2(lsteps(lno,:),i,'b'); 
       lno=lno+1;
    end
    if i==limit
       break; 
    end
end
end

