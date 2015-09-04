function [ cost, grad, pred] = reg1( theta, ei, data, labels, pred_only)
%reg1 Slave cost function for simple phone net
%   Does all the work of cost / gradient computation
%   Returns cost broken into cross-entropy, weight norm, and prox reg
%        components (ceCost, wCost, pCost)

%% default values
po = false;
if exist('pred_only','var')
  po = pred_only;
end;

%% reshape into network
stack = myNN.params2stack(theta, ei);
numHidden = numel(ei.layer_sizes) - 1;
hAct = cell(numHidden+1, 1);
gradStack = cell(numHidden+1, 1);
efunc= cell(numHidden+1, 1);
m=size(labels,2);
%% forward prop
%%% YOUR CODE HERE %%%
%sigmoid function and its deriv
if strcmp(ei.activation_fun,'logistic')
    AcFunc=@(A) 1./(1+exp(-A));
    dAcFun=@(A) A.*(1-A); %Assumption: The input A is AcFunc(A);
elseif strcmp(ei.activation_fun,'tanh')
    AcFunc=@tanh;
    dAcFun=@(A) 1-A.^2; %Assumption: The input A is AcFunc(A);
end
% logistic,tanh

%forward prop
for l=1:numHidden
     if l > 1
         hAct{l}=AcFunc(bsxfun(@plus,stack{l}.W*hAct{l-1},stack{l}.b));
    else
        hAct{l}=AcFunc(bsxfun(@plus,stack{l}.W*data,stack{l}.b));
    end;
    
end


 hAct{numHidden+1}=bsxfun(@plus,stack{numHidden+1}.W*hAct{numHidden},stack{numHidden+1}.b);
 pred=hAct{numHidden+1};

%% return here if only predictions desired.
if po
  cost = -1; ceCost = -1; wCost = -1; numCorrect = -1;
  grad = [];  
  return;
end;

%% compute cost
%%% YOUR CODE HERE %%%
temp=(pred-labels);
cost=sum(diag(temp*temp'))./(2*m); %Kisa yolu var mi?
  efunc{numHidden+1}=temp./m; %output error signal
  %also calculate l2 reg penalties into l2pen
  for l=numHidden:-1:1
      gradStack{l+1}.W=(efunc{l+1}*hAct{l}')+ei.lambda*stack{l+1}.W;
      gradStack{l+1}.b=sum(efunc{l+1},2);
      efunc{l}=(stack{l+1}.W'*efunc{l+1}).*dAcFun(hAct{l});
      cost=cost+(ei.lambda/2)*(sum(sum((stack{l+1}.W).^2)));
  end
  cost=cost+(ei.lambda/2)*(sum(sum((stack{1}.W).^2)));
  gradStack{1}.W=(efunc{1}*data')+ei.lambda*stack{1}.W;
  gradStack{1}.b=sum(efunc{1},2);
%% compute weight penalty cost and gradient for non-bias terms
%%% YOUR CODE HERE %%%


%% reshape gradients into vector
[grad] = myNN.stack2params(gradStack);
end



