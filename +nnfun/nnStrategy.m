function [ y ] = nnStrategy( x_RAW )
%nnFirstStep1 This gets the neural network parameters from
%./Learning/params/nn1.mat and then feed forward.
%x_RAW -> 12x1
%y_
load('.\nnParams\nnCSmix.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
y=mapminmax('reverse',y_RAW,ei.yPS);
y(6)=y(6)>0.5;
end

