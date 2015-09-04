function [ out ] = fixAngle( tra )
%UNTİTLED6 fixes the wrong angles
%   Sometimes -1.5 like some angles are recorded as 358, which causes
%   errors at differentiation. This function provide a continious angle. By
%   fixing those points of a column vector

out=tra;
for i=2:size(out,1)
    if abs(out(i,3)-out(i-1,3))>90 %Assumed:One cannot rotate his foot 90deg/frame
        %Assumption: Errors occur at small angles close to zero neg. or
        %%pos. WRONG!!
       if out(i,3)>0
            out(i:end,3)=out(i:end,3)-360;
       else
            out(i:end,3)=out(i:end,3)+360;
       end
    end
end

