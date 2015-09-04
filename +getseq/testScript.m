
acc=[];
iters=[50,100,200];
sizes=[50,100];

for i=1:length(sizes)
   for j=1:length(iters);
       [~,~,acct]=myNN.trainNN('dataNextStep0','nnNextStep',iters(j),sizes(i));
       acc=[acc acct];
   end
end