function [ output_args ] = visualizeTest( name )
%visualizeTest This function opens the test set, which have not been used
%during training indicadet in the name input. And then visualize the test
%set results with the nnFunctions with the same 'name'
load(strcat('./testSets/',name),'xtest','ytest');
figure;

for i=1:size(xtest,2)
    clf;
    axis([-0.7 0.7 -0.7 0.7]);
    hold on;
   guess=eval(strcat('nnfun.',name,'(xtest(:,i));'));
   anim.drawStance(ytest(:,i));
pause(0.5);
   anim.drawStance(guess);
pause;
end
end

