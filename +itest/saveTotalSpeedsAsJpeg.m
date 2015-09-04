close all;
if input('1-LoadData 0-AlreadLoaded\n')
    addpath('./dnew/')
    loadSub;
end

for seqNo=1:size(sub,2)
    clf
    seq=sub(seqNo);
   [ sdr,sdl] = getSpeeds( seq );
    plot(sdr,'r')
    hold on
    plot(sdl,'b')
     ss=size(sdr,1);
        plot(1:ss,ones(1,ss)*0.00020)
    saveas(gcf,sprintf('./SpeedPictures/sq%d.jpg',seqNo));
end