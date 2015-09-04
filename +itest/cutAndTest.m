function  cutAndTest( seq )
%cutAndTest It gets a sequence and cuts it with cutAndFixFrames with
%animation
    anim.animateCleanSeq(seq);
    rs=ppro2.cutAndFixFrames(seq);
    figure;
    for i=1:size(rs,2)
       anim.animateCuts(rs(1,i)); 
    end
end

