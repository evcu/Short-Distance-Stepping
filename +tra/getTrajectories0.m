function [btra,rtra,ltra] = getTrajectories0( gSeq )
%getTrajectories Gets each trajectory:Body RT/LT Foot and returns them as
%nx3 matrices.
load('./+tra/const','STACK_PER_FOOT','STACK_PER_TRAJECTORY');
inds=[1 0 gSeq.stepOrder];
xtra=tra.stackSteps(gSeq.steps(logical(inds),:),gSeq.steps(logical(~inds),:),gSeq.stepOrder(1),STACK_PER_FOOT);
[bdy, rt, lt]=nnfun.nnTrajectories0(xtra);
btra=rtools.vec2ang(reshape(bdy,4,STACK_PER_TRAJECTORY)');
rtra=rtools.vec2ang(reshape(rt,4,STACK_PER_TRAJECTORY)');
ltra=rtools.vec2ang(reshape(lt,4,STACK_PER_TRAJECTORY)');
end

