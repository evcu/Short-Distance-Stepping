function x = processInput(target,charStruct,startingFoot)
%processInput This function converts the target in to target oriented
%representation.
% Input variables are explained in generateSteps function.
% If startingFoot is equal to -1 then it is needs to be guessed
if isnumeric(charStruct)
    %Bias
    charStruct.bias=zeros(4,1);
    charStruct.bias(1)=getdefValue(2,1);
    charStruct.bias(2)=getdefValue(2,2);
    charStruct.bias(3)=getdefValue(2,3);
    charStruct.bias(4)=getdefValue(2,4);
    %Stance
    charStruct.stance=zeros(4,1);
    charStruct.stance(1)=getdefValue(1,1);
    charStruct.stance(2)=getdefValue(1,2);
    charStruct.stance(3)=getdefValue(1,3);
    charStruct.stance(4)=getdefValue(1,4);
    source=rtools.ang2vec(rtools.transformToSourceRepr(target))';
    x_stance=[source;charStruct.stance(1:2,1)]; %x_stance->6x1
    x=nnfun.nnStance1(x_stance);
    charStruct.strategy=nnfun.nnStrategy(x);
    startingFoot=-1;
else
    source=rtools.ang2vec(rtools.transformToSourceRepr(target))';
    x_stance=[source;charStruct.stance(1:2,1)]; %x_stance->6x1
    x=nnfun.nnStance1(x_stance); %x->8x1 rt-lt
end

if startingFoot==-1
    startingFoot=nnfun.nnFirstStep1([ x;charStruct.bias]);
end
x=[x;charStruct.strategy;charStruct.stance(3:4);startingFoot];
end

