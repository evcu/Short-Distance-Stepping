function [ sub2 ] = detectSteps( sub )
%detectSteps This function gets a sequence array and add various step related fields.
sub2=sub;
    for i=1:size(sub,2)     
        [rsteps, lsteps]=ppro.getStepIndices(sub(i));
        sub2(i).StopIndicesLeft=lsteps;
        sub2(i).StopIndicesRight=rsteps;
        sub2(i).LeftSteps=sub2(i).lTra(lsteps,:);
        sub2(i).RightSteps=sub2(i).rTra(rsteps,:);
        sub2(i).totalSteps=size(sub2(i).StopIndicesLeft,2)+size(sub2(i).StopIndicesRight,2)-2;
        sub2(i).targetLoc=[0 0 -1];
    end
end

