function drawGseqWithTra( gseq,drawFun,color,nnNo,showTra )
%drawGseq given gSeq structure it draws the steps one by one by pausing in
%between.
PAUSE_TIME=0.4;
load('./+tra/const.mat','SAMPLING_PERIOD');
rt_foot=rtools.ang2vec(gseq.steps(1,:))';
lt_foot=rtools.ang2vec(gseq.steps(2,:))';
anim.drawStance([rt_foot;lt_foot],0,drawFun);
for i=1:length(gseq.stepOrder)
    pause(PAUSE_TIME);
    isRT=gseq.stepOrder(i);
    if isRT
        clr='r';
    else
        clr='b';
    end 
    drawFun(gseq.steps(2+i,:),isRT,clr);  
end
if logical(showTra)
anim.animateTrajectories(gseq.bTra,gseq.rTra,gseq.lTra,nnNo,SAMPLING_PERIOD,color);
end
 pause(PAUSE_TIME);
end

