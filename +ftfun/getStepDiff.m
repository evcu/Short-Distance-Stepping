function [ out ] = getStepDiff( inp )
%getStepDiff This function calculates the length and rotation of a step.
% inp: n*3 step-stance locations
% out: 2*n-1 difference matrix, where 1.row->Length 2.row->Rotation
n=size(inp,1);
out=zeros(2,n-1);
for i=1:n-1
    out(1,i)=ppro.getDistance(inp(i,1:2),inp(i+1,1:2));
    out(2,i)=ftfun.getAngleDifference(inp(i,3),inp(i+1,3),1);
end
end

