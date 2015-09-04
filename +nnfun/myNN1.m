function [ y ] = myNN1( x_RAW )
%myNN1 This gets the neural network parameters from
%./Learning/params/nn1.mat and then feed forward.
addpath ./customNN
load('.\customNN\params\nn1.mat')
x=mapminmax('apply',x_RAW,ei.xPS);
[~, ~, y_RAW] = reg1( opt_params, ei, x, [], true);
y=mapminmax('reverse',y_RAW,ei.yPS);
end

