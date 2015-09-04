function [ x, y ] = getMatrices1( cuts )
%getMatrices1 prepareMatrices from the Cut Struct. 
%Idea-AntiIdea merge this with cutandFixFrames to speed up.NO. We may need them
%separetly
%x: 9xm
%y: 4xm
n=size(cuts,2);
x=zeros(9,n);
y=zeros(4,n);
    for i=1:n
        ct=cuts(i);
        x(1,i)=ct.RTorLT;
        x(2:5,i)=ct.rtFootStart';
        x(6:9,i)=ct.ltFootStart';
        y(:,i)=ct.StepTarget';
    end
end

