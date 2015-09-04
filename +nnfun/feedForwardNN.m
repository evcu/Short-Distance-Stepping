function y=feedForwardNN( name,x_RAW )
%feedForwardNN Basically loads NN and feedforward it.
% load('.\nnParams\<name>.mat')
% x=mapminmax('apply',x_RAW,ei.xPS); 
% [~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
% y=mapminmax('reverse',y_RAW,ei.yPS)';
%TODO delete all other not related nn function and use this! Need to modify
%all liblary
load(strcat('.\nnParams\',name,'.mat'));
x=mapminmax('apply',x_RAW,ei.xPS); 
[~, ~, y_RAW] = myNN.reg1( opt_params, ei, x, [], true);
y=mapminmax('reverse',y_RAW,ei.yPS)';
end

