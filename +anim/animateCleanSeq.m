function animateCleanSeq( seq,speedfactor )
%animateSteps  Given seq struct, the function animates the Trajectory with 
% the direction of the foots, SpeedFactor times faster.
%   Sequence struct has following fields:
%   seqNo: int
%   targetNo: int
%   subjNo: int
%   rTra: [nx3 double]
%   lTra: [nx3 double]
%   bdyTra: [nx3 double]
%   StopIndicesLeft: 1xn
%   StopIndicesRight: 1xn
%   LeftSteps: [2x3 double]
%   RightSteps: [2x3 double]
%   source: 1x3
%   targetLoc: 1x3 (After transform)
%   Left foot-->Blue
%   Right foot-->Red
%close all
%TODO create a function to draw an arrow.
ARROW_LENGTH=0.1;
DEFAULT_SPEED=15;
if nargin==1
    speedfactor=DEFAULT_SPEED;%Default Speed Value
end
clf
lf=seq.lTra;
rf=seq.rTra;
bdy=seq.bdyTra;
 anim.drawDestination(double(seq.targetLoc),'m'); %Input is measured in cm and needed to be in mm. So *10
   %fprintf('Theratical Direction:   %d\n',mod(all_targets(seq.targetNo,3),360));
 axis([-0.7 0.7 -0.7 0.7]) %Fixes the plot range
xlabel(strcat('Subject: ',int2str(seq.subjNo),',Sequence: ',int2str(seq.seqNo),',Target: ',int2str(seq.targetNo)));
hold on;
%plot(lf(:,1),lf(:,2),'b.')
%plot(rf(:,1),rf(:,2),'r.')

%SliderCode
b = uicontrol('Style','slider','Position',[150,60,300,15],...
              'Callback',@drawFrame,'value',size(lf,1), 'min',1, 'max',size(lf,1));
% bl1 = uicontrol('Style','text','Position',[50,54,23,23],...
%                 'String','1');
% bl2 = uicontrol('Style','text','Position',[500,54,23,23],...
%                 'String',sprintf('%d',size(lf,1)));
% bl3 = uicontrol('Style','text','Position',[240,25,100,23],...
%                 'String','Frame Number');
            
for i=1:size(seq.StopIndicesRight,2)
    anim.drawDestination(double(seq.rTra(seq.StopIndicesRight(i),:)),'r'); 
end

for i=1:size(seq.StopIndicesLeft,2)
    anim.drawDestination(double(seq.lTra(seq.StopIndicesLeft(i),:)),'b'); 
end

%Drawing Body center and its direction
ibdyangle=lf(1,3);
ibdyU = cosd(ibdyangle)*ARROW_LENGTH;
ibdyV = sind(ibdyangle)*ARROW_LENGTH;
hbdy = quiver(lf(1,1),lf(1,2),ibdyU,ibdyV,'go','AutoScale','off','LineWidth',2,'MarkerFaceColor','g',...
                   'YDataSource','bdyY','XDataSource','bdyX','UDataSource','bdyU','VDataSource','bdyV');
%quiver for the arrows as feets
ilangle=lf(1,3);
irangle=rf(1,3);
ilU = cosd(ilangle)*ARROW_LENGTH;
ilV = sind(ilangle)*ARROW_LENGTH;
irU = cosd(irangle)*ARROW_LENGTH;
irV = sind(irangle)*ARROW_LENGTH;
hl = quiver(lf(1,1),lf(1,2),ilU,ilV,'bo','AutoScale','off','LineWidth',2,'MarkerFaceColor','g',...
                   'YDataSource','lY','XDataSource','lX','UDataSource','lU','VDataSource','lV');

hr = quiver(rf(1,1),rf(1,2),irU,irV,'ro','AutoScale','off','LineWidth',2,'MarkerFaceColor','g',...
                   'YDataSource','rY','XDataSource','rX', 'UDataSource','rU','VDataSource','rV');

%for t = 1:1032
for t2 = 1:size(lf,1)/speedfactor
    t=t2*speedfactor;
    langle=lf(t,3);
    rangle=rf(t,3);
    bdyangle=bdy(t,3);
    lX = lf(t,1);
    lY = lf(t,2);
    lU = cosd(langle)*ARROW_LENGTH;
    lV = sind(langle)*ARROW_LENGTH;
    rX = rf(t,1);
    rY = rf(t,2);
    rU = cosd(rangle)*ARROW_LENGTH;
    rV = sind(rangle)*ARROW_LENGTH;
    bdyX = bdy(t,1);
    bdyY = bdy(t,2);
    bdyU = cosd(bdyangle)*ARROW_LENGTH;
    bdyV = sind(bdyangle)*ARROW_LENGTH;
    refreshdata(hl,'caller');
    refreshdata(hr,'caller');
    refreshdata(hbdy,'caller');
    drawnow;
    %pause(.001);
end
    function drawFrame(source,callbackdata)
        t = floor(source.Value);
        maps = source.String;
        langle=lf(t,3);
        rangle=rf(t,3);
        bdyangle=bdy(t,3);
        lX = lf(t,1);
        lY = lf(t,2);
        lU = cosd(langle)*ARROW_LENGTH;
        lV = sind(langle)*ARROW_LENGTH;
        rX = rf(t,1);
        rY = rf(t,2);
        rU = cosd(rangle)*ARROW_LENGTH;
        rV = sind(rangle)*ARROW_LENGTH;
        bdyX = bdy(t,1);
        bdyY = bdy(t,2);
        bdyU = cosd(bdyangle)*ARROW_LENGTH;
        bdyV = sind(bdyangle)*ARROW_LENGTH;
        refreshdata(hl,'caller');
        refreshdata(hr,'caller');
        refreshdata(hbdy,'caller');
        xlabel(strcat('Subject: ',int2str(seq.subjNo),',Sequence: ',int2str(seq.seqNo),',Target: ',int2str(seq.targetNo),',Frame:',int2str(t)));
        drawnow;
    end
end

