function [ y ] = nnStance1( x_RAW )
%myNN1 This gets the neural network parameters from
%./Learning/params/nn1.mat and then feed forward.
%x_RAW -> 6x1
load('.\nnParams\nnStance1.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
y=mapminmax('reverse',y_RAW,ei.yPS);
end

