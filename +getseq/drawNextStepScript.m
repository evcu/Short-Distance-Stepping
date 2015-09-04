load('./testSets/nnNextStep.mat')
   figure;
for i=1:size(xtest,2)
   y=nnfun.nnNextStep(xtest(:,i));
    clf;
    axis([-0.7 0.7 -0.7 0.7]);
    hold on;
   anim.drawStance(xtest(1:8,i),1);
   if xtest(end,i)==1
      clr='r'; 
   else
      clr='b'; 
   end
   anim.drawDestination(rtools.vec2ang(ytest(:,i)'),clr);
   pause(0.5);
   anim.drawDestination(rtools.vec2ang(y'),'m');

    

   
end