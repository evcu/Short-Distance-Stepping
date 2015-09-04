function [ step_order ] = getStepOrder( seq )
%getStepOrder This function takes a cleaned sequence and then returns
%step_order binary vector.0->Left 1->Right
%I dont care the first stances.
nl=length(seq.StopIndicesLeft)-1;
steps=[seq.StopIndicesLeft(1,2:end) seq.StopIndicesRight(1,2:end)];
[~, step_order]=sort(steps);
step_order(step_order<=nl)=0;
step_order(step_order~=0)=1;
end

