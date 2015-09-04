function animateGivenSequences( sub,indexes_asked )
%animateGivenSequences Animates all sequences without asking any input
%   Detailed explanation goes here
close all;
for seqNo=1:size(indexes_asked,2)
    %For saving and investigating. From here to
    seq=sub(seqNo);
    [rs,ls]=ppro.getSpeeds(seq);
    fprintf('------------------------------------------\n%dth Seq\n',seqNo);
    fprintf('Average Feet Direction: %f\n',mod((seq.lTra(1,3)+seq.rTra(1,3))/2,360))
    fprintf('Body Direction:         %f\n',mod(seq.bdyTra(1,3),360));
        figure(1);
        anim.animateSteps(seq)
        figure(2);
        clf
        plot(rs,'r')
        hold on
        plot(ls,'b')
        ss=size(rs,1);
        plot(1:ss,ones(1,ss)*0.0002) %Threshold
        pause(0.5);
end
end

