function [ gSeq,charStruct ] = generateSteps( target,charStruct,startingFoot,fixedSamplingFlag )
%generateSteps This function gets a target and stepping charasteristic in a
%struct and then returns a gSeq struct.
% Possible inputs
% generateSteps( target,charStruct,startingFoot )
% generateSteps( target,charStruct)
% generateSteps( target)
%Inputs:
% target:             1x3 
% charStruct.bias     4x1 
% charStruct.stance   4x1  
% charStruct.strategy 6x1 
% startingFoot(optional) 1->RT 0->LT
% fixedSamplingFlag is 1 if you use nnTrajectories.m 0 if you like to use
% nnTrajectories0.m
% Output:
% gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance. First
% step is RT
% gSeq.stepOrder  1xn
% gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n+1)x4 || gSeq.bTra mx4 
%Process the input
if nargin<4
  fixedSamplingFlag=-1;  
    if nargin<3
        startingFoot=-1; %To indicate that it needs to be guessed.
        if nargin<2
         %To indicate that it needs to be guessed.
        charStruct=-1;
        end
    end
end
x=getseq.processInput(target,charStruct,startingFoot);
%Guess step sequence
gSeq_TargetOriented=getseq.guessStepSequence0(x,fixedSamplingFlag);
gSeq_TargetOriented.target=target;
gSeq=rtools.gSeq2SourceRep(gSeq_TargetOriented);
end

