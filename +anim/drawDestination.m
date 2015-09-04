function drawDestination( inp,isRT,clr )
%drawDestination draws a T located at x,y oriented with angle
%   inp=[x y angle]
%If the input angle is in vector representation, then it converts it.
if nargin==2
   clr=isRT; 
end
        if length(inp)==4
           inp=rtools.vec2ang(inp); 
        end
        ARROW_LENGTH=0.05;
        xnew=repmat(inp(1),1,3);
        ynew=repmat(inp(2),1,3);
        angle=inp(3);
        uinit=[cosd(angle)*ARROW_LENGTH,cosd(angle-90)*ARROW_LENGTH/3,cosd(angle+90)*ARROW_LENGTH/3];
        vinit=[sind(angle)*ARROW_LENGTH,sind(angle-90)*ARROW_LENGTH/3,sind(angle+90)*ARROW_LENGTH/3];
        quiver(xnew,ynew,uinit,vinit,'Color',clr,'AutoScale','off','LineWidth',1.5);
end

