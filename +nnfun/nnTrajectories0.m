function [ ybdy, yrt, ylt ] = nnTrajectories0( x_RAW )
%nnNextStep This gets the neural network parameters from
%./Learning/params/nnNextStep.mat and then feed forward.
%x_RAW -> 17x1
load('.\nnParams\nnTra0Bdy.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
ybdy=mapminmax('reverse',y_RAW,ei.yPS)';

load('.\nnParams\nnTra0LT.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
ylt=mapminmax('reverse',y_RAW,ei.yPS)';

load('.\nnParams\nnTra0RT.mat')
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
yrt=mapminmax('reverse',y_RAW,ei.yPS)';
end

