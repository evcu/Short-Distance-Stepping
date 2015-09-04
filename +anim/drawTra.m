function drawTraPoint( inp,clr )
%drawTra draws a body trajectory point consists of 4 parameters:[x y gama
%tangent_ang]
%It draws an arrow at [x,y] with the direction dictated by gama and then
%draws a line with tangent_ang
ARROW_LENGTH=0.02;
xnew=repmat(inp(1),1,3);
ynew=repmat(inp(2),1,3);
angle=inp(3);
angle2=inp(4);
angle3=angle2-180;
uinit=[cosd(angle2)*ARROW_LENGTH,cosd(angle3)*ARROW_LENGTH];
vinit=[sind(angle2)*ARROW_LENGTH,sind(angle3)*ARROW_LENGTH];
uinit2=[cosd(angle)*ARROW_LENGTH];
uinit2=[sind(angle)*ARROW_LENGTH];
quiver(xnew(1:2),ynew(1:2),uinit,vinit,'Color',clr,'AutoScale','off','LineWidth',1.5);
quiver(inp(1),inp(2),uinit2,uinit2,'Color','k','AutoScale','off','LineWidth',1.5);
end

