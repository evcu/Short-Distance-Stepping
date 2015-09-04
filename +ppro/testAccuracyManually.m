close all;
if input('1-LoadData 0-AlreadLoaded\n')
    addpath('./dnew/')
    ppro.loadSub;
    accuracy=ones(size(sub));
end
if input('1-Restart 0-Continue\n')
    saved=1;
end
for seqNo=saved:size(sub,2)
    %For saving and investigating. From here to
    seq=sub(seqNo);
    [rs,ls]=ppro.getSpeeds(seq);
    %Here
    flag=2;
    while flag==2
    anim.animateSteps(seq);
    fprintf('%dth Seq\n',seqNo);
    flag=input('1-true 0-false 2-repeat? 3-save, 4-put2 exist\n');
    if flag==3
        saved=seqNo;
        clf 
        plot(rs,'r')
        hold on
        plot(ls,'b')
        ss=size(rs,1);
        plot(1:ss,zeros(1,ss))
        plot(1:ss,ones(1,ss)*0.0002)
        fprintf('The last seq was %d',seqNo);
        return;
    end
    end
    if ~flag; %1 is for true 0 is false
        accuracy(seqNo)=0;
    end   
    if flag==4; 
        accuracy(seqNo)=2;
    end
    
    
end

if seqNo==size(sub,2)
eval(sprintf('save(''./dnew/accuracy/accuracy%d'',''accuracy'');',subNo));
cuts=input('cuts matrix 2xn\n')
eval(sprintf('save(''./dnew/cuts/cut%d'',''cuts'');',subNo));
ppro.cleanAndSave(subNo);
end
