function hbdy=animateTrajectories( bdy,rf,lf,nnNo,SAMPLING_PERIOD,clr)
%animateTrajectory
ARROW_LENGTH=0.1;
if nargin<3
    error('Ups that is not possible. You may want to use animateTrajectories ');
else if nargin==3
        clr='m';%Default Speed Value
    end
    assert(size(bdy,1)==size(rf,1)&&size(lf,1)==size(rf,1),'I am a bug caused by an earlier mistake');
    plot(bdy(:,1),bdy(:,2),strcat(clr,'-'));
    plot(rf(:,1),rf(:,2),strcat('r','-'));
    plot(lf(:,1),lf(:,2),strcat('b','-'));
    
    hbdy=anim.createTrajectoryQuiver(bdy,ARROW_LENGTH,clr);
    hrf=anim.createTrajectoryQuiver(rf,ARROW_LENGTH,'r');
    hlf=anim.createTrajectoryQuiver(lf,ARROW_LENGTH,'b');
    for t = 2:size(bdy,1)
        hbdy=anim.refreshQuiver(hbdy,bdy(t,:),ARROW_LENGTH);
        hrf=anim.refreshQuiver(hrf,rf(t,:),ARROW_LENGTH);
        hlf=anim.refreshQuiver(hlf,lf(t,:),ARROW_LENGTH);
        drawnow;
        if ~nnNo
        xlabel(sprintf('%2f sec',t*(SAMPLING_PERIOD/400)));
        end
        pause((SAMPLING_PERIOD/500));  %400 frame/sec 100frame sampling period equals 0.25seconds for each frame.
    end
end

