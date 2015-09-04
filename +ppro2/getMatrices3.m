function [ x, y ] = getMatrices3( cuts )
%getMatrices2 prepareMatrices from the Cut Struct. 
%This version is for training isEnded machine.
%x: 8xm
%y: 1xm
%Note on 5th August. I do not this anymore since I've fixed ending by
%adding still-cuts to the data set. So all sequences converges to these
%still-positions.
n=size(cuts,2);
x=zeros(8,n);
y=zeros(1,n);
    for i=1:n
        ct=cuts(i);
        x(1:4,i)=ct.rtFootStart';
        x(5:8,i)=ct.ltFootStart';
        y(1,i)=ct.isEnd;
    end
end

