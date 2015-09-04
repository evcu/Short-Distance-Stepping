function gSeq=guessStepSequence2(x)
%guessStepSequence given the first stance this function calculates the
%whole stepping sequence by consequetively calling the nnNextStep function
%The output is explained in generateSteps function. Let me copy it also
%here
% Output:
% gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance.
% gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n)x4*m
%The stance
%TWO IS FOR TRAJECTORY GUESSING
STEP_LIMIT=20;
gSeq.steps(1,:)=rtools.vec2ang(x(1:4)');
gSeq.steps(2,:)=rtools.vec2ang(x(5:8)');

for i=3:STEP_LIMIT
     steppingFoot=x(end);
     y=nnfun.nnNextStep(x);
     if getseq.isStationary(x,y,steppingFoot)
         return;
     end
     gSeq.bTra(i-2,:)=nnfun.nnBdyTra2([x(1:8);y;steppingFoot;i==3]);
     gSeq.steps(i,:)=rtools.vec2ang(y');
     gSeq.stepOrder(i-2)=steppingFoot;
     x_new=rtools.ang2vec(gSeq.steps(i,:))'; %This is for normalizing the direction vector 
     if steppingFoot %1 is for RT
        x(1:4)=x_new; 
     else
        x(5:8)=x_new;
     end
     x(end)=~x(end);
     
    
end

