function [p1,p2] = im2poly( imageName,saveON )
%im2poly gets the step image and then creates the polygon vertices.

THE_CENTER_OF_FOOT=[35,15];
FOOT_WIDTH=0.055;
FOOT_LENGTH=0.15;
x = imread(imageName);
x2=x;
for i=2:size(x,1)
    for j=2:size(x,2)
        if x(i,j)<4&&x(i+1,j)<4&&x(i,j+1)<4&&x(i-1,j)<4&&x(i,j-1)<4
            x2(i,j)=15;
        end
    end
end
[x, y]=find(x2<4);
p1.x=x(x<38);
p1.y=y(x<38);
[~, I] = sort(angle(complex(p1.x-mean(p1.x),p1.y-mean(p1.y))));
p1.x = p1.x(I)-THE_CENTER_OF_FOOT(1);
p1.y = p1.y(I)-THE_CENTER_OF_FOOT(2);


p2.x=x(x>=38);
p2.y=y(x>=38);
[~, I] = sort(angle(complex(p2.x-mean(p2.x),p2.y-mean(p2.y))));
p2.x = p2.x(I)-THE_CENTER_OF_FOOT(1);
p2.y = p2.y(I)-THE_CENTER_OF_FOOT(2);
p1=rotatearoundOrigin(p1,-90);
p2=rotatearoundOrigin(p2,-90);
plsf=FOOT_LENGTH/(max(p1.y)-min(p2.y)); %pls->poly_length_scalefactor
pwsf=FOOT_WIDTH/(max(p1.x)-min(p1.x));  %pws->poly_width_scalefactor
p1.x=p1.x*pwsf;
p1.y=p1.y*plsf;
p2.x=p2.x*pwsf;
p2.y=p2.y*plsf;
if saveON 
    display sayhi
end
end

