function animateCuts( rs )
%animateCuts Animates cut structure which has following fields
%     rtFootStart: 1x3
%     ltFootStart: 1x3
%     RTorLT: 0-->LT, 1-->RT
%     Traj: 100x3 double
%     StepTarget: 1x3
ARROW_LENGTH=0.1;
DEFAULT_SPEED=1;
if nargin==1
    speedfactor=DEFAULT_SPEED;%Default Speed Value
end
if size(rs.Traj,2)==4
rs.Traj=rtools.vec2ang(rs.Traj);
end
x=rs.Traj(:,1);
y=rs.Traj(:,2);
angles=rs.Traj(:,3);
clf
%SliderCode
b = uicontrol('Style','slider','Position',[150,60,300,15],...
              'Callback',@drawFrame,'value',100, 'min',1, 'max',100);

anim.drawDestination(rs.rtFootStart,'r');
%xlabel(strcat('Subject: ',int2str(seq.subjNo),',Sequence: ',int2str(seq.seqNo),',Target: ',int2str(seq.targetNo)));
axis([-0.7 0.7 -0.7 0.7]) %Fixes the plot range
hold on;
anim.drawDestination(rs.ltFootStart,'b');
if rs.RTorLT
   anim.drawDestination(rs.StepTarget,'r');
   movingFootColor='ro';
else
   anim.drawDestination(rs.StepTarget,'b'); 
   movingFootColor='bo';
end


%quiver for the arrows as feets
iangle=angles(1);
iU = cosd(iangle)*ARROW_LENGTH;
iV = sind(iangle)*ARROW_LENGTH;
h = quiver(x(1),y(1),iU,iV,movingFootColor,'AutoScale','off','LineWidth',2,'MarkerFaceColor','g',...
                   'YDataSource','Y','XDataSource','X','UDataSource','U','VDataSource','V');
               
for t2 = 1:numel(x)/speedfactor
    t=t2*speedfactor;
    angle=angles(t);
    X = x(t);
    Y = y(t);
    U = cosd(angle)*ARROW_LENGTH;
    V = sind(angle)*ARROW_LENGTH;
    refreshdata(h,'caller');
    drawnow;
    %pause(.001);
end
    function drawFrame(source,callbackdata)
        angle=angles(t);
    X = x(t);
    Y = y(t);
    U = cosd(angle)*ARROW_LENGTH;
    V = sind(angle)*ARROW_LENGTH;
    refreshdata(h,'caller');
        refreshdata(h,'caller');
        xlabel(strcat('Frame:',int2str(t)));
        drawnow;
    end
end

