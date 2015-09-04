function [ cost, grad, pred] = comb1( theta, ei, data, labels, pred_only)
%SPNETCOSTSLAVE Slave cost function for simple phone net
%   Does all the work of cost / gradient computation
%   Returns cost broken into cross-entropy, weight norm, and prox reg
%        components (ceCost, wCost, pCost)

%% default values
sep_i=ei.sepI;
po = false;
if exist('pred_only','var')
  po = pred_only;
end;
sigmoid=@(A) 1./(1+exp(-A));
dsigmoid=@(A) A.*(1-A);
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
    AcFunc=sigmoid;
    dAcFun=dsigmoid; %Assumption: The input A is AcFunc(A);
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
 pred(sep_i:end,:)=sigmoid(pred(sep_i:end,:));
%% return here if only predictions desired.
if po
  cost = -1; ceCost = -1; wCost = -1; numCorrect = -1;
  grad = [];  
  return;
end;

%% compute cost
%%% YOUR CODE HERE %%%
predLin=pred(1:(sep_i-1),:);
predLog=pred(sep_i:end,:);
labelLin=labels(1:(sep_i-1),:);
labelLog=labels(sep_i:end,:);
temp=(predLin-labelLin);
costLin=sum(diag(temp*temp'))./(2*m); %Kisa yolu var mi?

costLog=sum(-labelLog.*log(predLog)-(1-labelLog).*log(1-predLog))/m; %(theta'*X)'=(X'*theta)
cost=costLin+costLog;
eFunLog=predLog-labelLog;
  efunc{numHidden+1}=[temp;eFunLog]./m; %output error signal
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



