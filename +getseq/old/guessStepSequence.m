function gSeq=guessStepSequence(x)
%guessStepSequence given the first stance this function calculates the
%whole stepping sequence by consequetively calling the nnNextStep function
%The output is explained in generateSteps function. Let me copy it also
%here
% Output:
% gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance.
% gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n+1)x4
%The stance
STEP_LIMIT=20;
gSeq.steps(1,:)=rtools.vec2ang(x(1:4)');
gSeq.steps(2,:)=rtools.vec2ang(x(5:8)');
x_tra_past=x(1:8);
x_tra_now=x_tra_past;
gSeq.bTra(1,:)=nnfun.nnBdyTra([x_tra_past;x_tra_now]); %y->4x1
for i=3:STEP_LIMIT
    x_tra_past=x_tra_now;
     steppingFoot=x(end);
     y=nnfun.nnNextStep(x);
     if getseq.isStationary(x,y,steppingFoot)
         return;
     end
     gSeq.steps(i,:)=rtools.vec2ang(y');
     gSeq.stepOrder(i-2)=steppingFoot;
     x_new=rtools.ang2vec(gSeq.steps(i,:))'; %This is for normalizing the direction vector 
     if steppingFoot %1 is for RT
        x(1:4)=x_new; 
     else
        x(5:8)=x_new;
     end
     x_tra_now=x(1:8);
     gSeq.bTra(i-1,:)=nnfun.nnBdyTra([x_tra_past;x_tra_now]);
     x(end)=~x(end);
end

