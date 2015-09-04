function [btra,rtra,ltra] = getTrajectories( gSeq )
%getTrajectories Gets each trajectory:Body RT/LT Foot and returns them as
%nx3 matrices.
load('./+tra/const','STACK_PER_FOOT');
inds=[1 0 gSeq.stepOrder];
xtra=tra.stackSteps(gSeq.steps(logical(inds),:),gSeq.steps(logical(~inds),:),gSeq.stepOrder(1),STACK_PER_FOOT);
[bdy, rt, lt]=nnfun.nnTrajectories(xtra);
TRAJECTORY_LENGTH=length(bdy)/4;
btra=rtools.vec2ang(reshape(bdy,TRAJECTORY_LENGTH,4));
rtra=rtools.vec2ang(reshape(rt,TRAJECTORY_LENGTH,4));
ltra=rtools.vec2ang(reshape(lt,TRAJECTORY_LENGTH,4));
end

