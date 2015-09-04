function hbdy=animateTrajectory( traj,clr,total_frame,hbdy)
%animateTrajectory  
ARROW_LENGTH=0.1;

if nargin==1
    clr='m';%Default Speed Value
end
if nargin<4||isnumeric(hbdy)
    doCreate=1;
else
    doCreate=0;
end
bdy=traj;         
%Drawing Body center and its direction

plot(bdy(:,1),bdy(:,2),strcat(clr,'-'));
if doCreate
ibdyangle=bdy(1,3);
ibdyU = cosd(ibdyangle)*ARROW_LENGTH;
ibdyV = sind(ibdyangle)*ARROW_LENGTH;
hbdy = quiver(bdy(1,1),bdy(1,2),ibdyU,ibdyV,'go','AutoScale','off','LineWidth',2,'MarkerFaceColor','g',...
                   'YDataSource','bdyY','XDataSource','bdyX','UDataSource','bdyU','VDataSource','bdyV');
end
%quiver for the arrows as feets

for t = 1:total_frame
    bdyangle=bdy(t,3);
    bdyX = bdy(t,1);
    bdyY = bdy(t,2);
    bdyU = cosd(bdyangle)*ARROW_LENGTH;
    bdyV = sind(bdyangle)*ARROW_LENGTH;
    refreshdata(hbdy,'caller');
    drawnow;
    pause(0.1);
end
end

