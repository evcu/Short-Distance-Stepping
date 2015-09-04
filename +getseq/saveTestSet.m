function saveTestSet( xtest,ytest,ei,save_name,isReg )
%saveTestSet This function saves the test set in the 
xtest=mapminmax('reverse',xtest,ei.xPS); 
if isReg
ytest=mapminmax('reverse',ytest,ei.yPS);  
end
save(sprintf('./testSets/%s',save_name),'xtest','ytest');

end

