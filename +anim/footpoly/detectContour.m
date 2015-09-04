function [ poly1,poly2 ] = detectContour( name )
%detectContour	Prepares the foot polygons and saves them goes with st.png
%image
THE_CENTER_OF_FOOT=0.1;
FOOT_WIDTH=0.055;
FOOT_LENGTH=0.15;
[~, ~, sd]=imread(name);
mid=floor(size(sd,2)/2);
lfoot=imrotate(sd(:,1:mid),-10);
% rfoot=imrotate(sd(:,mid+1:end),15);
lf_cntr = edge(lfoot);
% rf_cntr = edge(rfoot);
[xl,yl]=find(lf_cntr==1);
% [xr,yr]=find(lf_cntr==1);

min_x=min(xl);
max_x=max(xl);
min_y=min(yl);
max_y=max(yl);
FootCenter_y=(max_y+min_y)*0.5;
FootCenter_x=(max_x+min_x)*(1-THE_CENTER_OF_FOOT);
width=max_y-min_y;
scalefactor=FOOT_WIDTH/width;
SEPRATION_X_VALUE=290;
xPoly1=xl(xl<SEPRATION_X_VALUE);
xPoly2=xl(xl>SEPRATION_X_VALUE);
yPoly1=yl(xl<SEPRATION_X_VALUE);
yPoly2=yl(xl>SEPRATION_X_VALUE);

[~, I1] = sort(angle(complex(xPoly1-mean(xPoly1),yPoly1-mean(yPoly1))));
[~, I2] = sort(angle(complex(xPoly2-mean(xPoly2),yPoly2-mean(yPoly2))));

poly1.x=(FootCenter_x-xPoly1(I1))*scalefactor;
poly1.y=(FootCenter_y-yPoly1(I1))*scalefactor;
poly2.x=(FootCenter_x-xPoly2(I2))*scalefactor;
poly2.y=(FootCenter_y-yPoly2(I2))*scalefactor;
save('./+anim/stepLeft','poly1','poly2');
poly1.y=-poly1.y;
poly2.y=-poly2.y;
save('./+anim/stepRight','poly1','poly2');
end

