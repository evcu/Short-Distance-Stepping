function [ y ] = nnFirstStep1( x_RAW )
%nnFirstStep1 This gets the neural network parameters from
%./Learning/params/nn1.mat and then feed forward.
%x_RAW -> 12x1
%y_
load('.\nnParams\nnFirstStep3.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_prob] = myNN.clsf1( opt_params, ei, x, [], true);
if y_prob(1)>y_prob(2)
   y=1;
else
   y=0;
end
end

