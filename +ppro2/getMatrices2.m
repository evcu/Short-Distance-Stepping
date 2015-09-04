function [ x, y ] = getMatrices2( cuts )
%getMatrices2 prepareMatrices from the Cut Struct. 
%This version process the cuts which include isStop isStart fields and
%include them in the input. For now I am not including isStart in the
%input. isEnd is added to the output.
%x: 9xm
%y: 5xm
n=size(cuts,2);
x=zeros(9,n);
y=zeros(5,n);
    for i=1:n
        ct=cuts(i);
        x(1,i)=ct.RTorLT;
        x(2:5,i)=ct.rtFootStart';
        x(6:9,i)=ct.ltFootStart';
        y(1:4,i)=ct.StepTarget';
        y(5,i)=ct.isEnd;
    end
end

