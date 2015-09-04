function [ output_args ] = drawFoot( param,isRT,color )
%drawFoot This function draws a foot image to the specified location. Two
%polygons are induced from the step.gif image and the result is embedded
%into this code. The code to generate polygon can be find in the
%./anim/footpoly folder

%This are the parameters of the foot at 0 degrees.
if nargin==2 %Default colors
    if isRT
        color='r';
    else
        color='b';
    end 
end

if isRT
   load('./+anim/stepRight'); 
else
   load('./+anim/stepLeft'); 
end
poly1=rtools.rotateAndTranslatePoly(poly1,param);
poly2=rtools.rotateAndTranslatePoly(poly2,param);
patch(poly1.x,poly1.y,color,'FaceColor','none','EdgeColor',color)
patch(poly2.x,poly2.y,color,'FaceColor','none','EdgeColor',color)

end

