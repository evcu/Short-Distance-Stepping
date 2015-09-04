function drawGseqWithTra2( gseq,drawFun )
%drawGseq given gSeq structure it draws the steps one by one by pausing in
%between.
% gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance.
% gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n)x4*m
SAMPLING_FREQ=10;
PAUSE_TIME=1;
rt_foot=rtools.ang2vec(gseq.steps(1,:))';
lt_foot=rtools.ang2vec(gseq.steps(2,:))';
anim.drawStance([rt_foot;lt_foot],0,drawFun);
j=1;
qv=0;
for i=1:length(gseq.stepOrder)
    pause(PAUSE_TIME);
    isRT=gseq.stepOrder(i);
    if isRT
        color='r';
    else
        color='b';
    end 
    drawFun(gseq.steps(2+i,:),isRT,color);

    qv=anim.animateTrajectory(gseq.bTra(j:j+9,:),'m',SAMPLING_FREQ,qv);
    j=j+10;
end
end

