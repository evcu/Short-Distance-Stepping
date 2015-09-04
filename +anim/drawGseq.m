function drawGseq( gseq,drawFun )
%drawGseq given gSeq structure it draws the steps one by one by pausing in
%between.
PAUSE_TIME=1;
rt_foot=rtools.ang2vec(gseq.steps(1,:))';
lt_foot=rtools.ang2vec(gseq.steps(2,:))';
anim.drawStance([rt_foot;lt_foot],0,drawFun);
for i=1:length(gseq.stepOrder)
    pause(PAUSE_TIME);
    isRT=gseq.stepOrder(i);
    if isRT
        color='r';
    else
        color='b';
    end 
    drawFun(gseq.steps(2+i,:),isRT,color);  
end
end

