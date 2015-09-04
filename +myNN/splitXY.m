function [ x_train, y_train, x_test, y_test,xPS,yPS ] = splitXY( X,y,ei,isRegression)
%splitXY splits data into train and test.
% X: n*m ->n input features m instance
% y: k*m ->k output features m instance
% testPercent: [0 1];
%isRegression 1->regression 0->Classification
%activ_fun: 'tanh' or 'logistic'
activ_fun=ei.activation_fun;
testPercent=ei.testPercent;
if strcmp(activ_fun,'tanh');
    [X,xPS]=mapminmax(X);
    if isRegression;
        [y,yPS]=mapminmax(y);
    else
        yPS=nan;
    end
else
    [X,xPS]=mapminmax(X,0,1);
    if isRegression;
        [y,yPS]=mapminmax(y,0,1);
    else
        yPS=nan;
    end
end

n=size(X,1);
data=[X;y];
m=size(data,2);
data = data(:, randperm(m));
test_border=floor(m*testPercent);
% Split into train and test sets
% The last row of 'data' is the median home price.
x_test = data(1:n,1:test_border);
y_test = data((n+1):end,1:test_border);

x_train = data(1:n,(test_border+1):end);
y_train = data((n+1):end,(test_border+1):end);
end

