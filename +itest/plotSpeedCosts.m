function plotSpeedCosts( seq )
%plotSpeedCosts plots the overall rt-lt foot speed functions
%   Detailed explanation goes here
 [rs,ls]=ppro.getSpeeds(seq);
        plot(rs,'r')
        hold on
        plot(ls,'b')
        ss=size(rs,1);
        plot(1:ss,ones(1,ss)*0.0002)
        fprintf('%dth Seq\n',seqNo);

end

