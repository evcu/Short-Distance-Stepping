function [ opt_params,ei,acc ] = trainNN(data_name,save_name,maxiter,layers,isRegression )
%trainNN This code is updated version of UFLDL-tutorial's multilayer supervised
%train script
% runs training procedure for supervised multilayer network
% softmax output layer with cross entropy loss function.
% X: n*m ->n input features m instance
% y: k*m ->k output features m instance
LAMBDA=0.000001;
LAYER_SIZE=100;
MAX_ITER=100;
isREG=1;
TEST_PERCENT=0.1;
load(sprintf('./xyData/%s',data_name),'x','y');
saveOn=false;
if nargin>1
    saveOn=true;
    if nargin>2
        MAX_ITER=maxiter;
        if nargin>3
            LAYER_SIZE=layers;
             if nargin>4
            isREG=isRegression;
             end
        end
    end
end
%isREG=0;
if isREG
    cFunc=@myNN.reg1;
else
     cFunc=@myNN.clsf1;
end
%% setup environment
% experiment information
% a struct containing network layer sizes etc
ei = [];
n=size(x,1);
k=size(y,1);
m=size(x,2);
% add common directory to your path for
% minfunc and mnist data helpers
addpath(genpath('./minFunc'));

%% split data
% which type of activation function to use in hidden layers
% feel free to implement support for only the logistic sigmoid function
ei.activation_fun = 'tanh'; % logistic,tanh
ei.testPercent=TEST_PERCENT;

[data_train, labels_train, xtest, ytest,xPS,yPS] = myNN.splitXY(x,y,ei,isREG);

%% populate ei with the network architecture to train
% ei is a structure you can use to store hyperparameters of the network
% the architecture specified below should produce  100% training accuracy
% You should be able to try different network architectures by changing ei
% only (no changes to the objective function code)

%Preprocessing xPS struct
ei.xPS=xPS;
%Postprocessing yPS struct
ei.yPS=yPS;
% dimension of input features
ei.input_dim = n;
% number of output classes
ei.output_dim = k;
% sizes of all hidden layers and the output layer
ei.layer_sizes = [LAYER_SIZE, ei.output_dim];
% scaling parameter for l2 weight regularization penalty
ei.lambda = LAMBDA;


%% setup random initial weights
stack = myNN.initialize_weights(ei);
params = myNN.stack2params(stack);

%% setup minfunc options
options = [];
options.display = 'iter';
options.maxFunEvals = 1e6;
options.Method = 'lbfgs';
options.MaxIter=MAX_ITER;
% myNN.grad_check(cFunc,params,50,ei, data_train, labels_train);
% pause();
%% run training
[opt_params,~,~,~] = minFunc(cFunc,params,options,ei, data_train, labels_train);

%% compute accuracy on the test and train set
[~, ~, pred1] = cFunc( opt_params, ei, xtest, [], true);
[~, ~, pred2] = cFunc( opt_params, ei, data_train, [], true);
%TODO-Accuracy function may be added.
if isREG
    err_test = pred1'-ytest';
    err_test_mean = mean(err_test.^2,1);
    err_train = pred2'-labels_train';
     err_train_mean = mean(err_train.^2,1);
%     err_test = (rtools.vec2ang(pred1')-rtools.vec2ang(ytest'));
%     err_test(:,3)=err_test(:,3)*(pi/180);
%     err_test_mean = mean(err_test.^2,1);
     fprintf(strcat('test error:  ',sprintf('%6.4f\t', err_test_mean),'\n'));
%      err_train = (rtools.vec2ang(pred2')-rtools.vec2ang(labels_train'));
%      err_train(:,3)=err_train(:,3)*(pi/180);
%     err_train_mean = mean(err_train.^2,1);
     fprintf(strcat('trainerror:  ',sprintf('%6.4f\t', err_train_mean),'\n'));
else
[~,pred1] = max(pred1);
err_test = diag(ytest(pred1,:))==0;
err_test_mean=mean(err_test);
fprintf('test error: %f\n', err_test_mean*100);
[~,pred2] = max(pred2);
err_train = diag(labels_train(pred2,:))==0;
err_train_mean=mean(err_train );
fprintf('trainerror: %f\n', err_train_mean*100);
end
ei.etest=err_test;
ei.etest_mean=err_test_mean;
ei.etrain=err_train;
ei.etrain_mean=err_train_mean;
ei.options=options;
if saveOn
save(sprintf('./nnParams/%s',save_name),'opt_params','ei');
%Renormalize saved test_data;
getseq.saveTestSet(xtest,ytest,ei,save_name,isREG );
end
acc=[err_test ;err_train];
end

