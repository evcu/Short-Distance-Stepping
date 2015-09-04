function [ y ] = nnNextStep( x_RAW )
%nnNextStep This gets the neural network parameters from
%./Learning/params/nnNextStep.mat and then feed forward.
%x_RAW -> 17x1
load('.\nnParams\nnNextStep4.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
y=mapminmax('reverse',y_RAW,ei.yPS);
end

