function drawSurface( x,y,z,flag )
%UNTÝTLED7 Summary of this function goes here
%   Detailed explanation goes here
xlin = linspace(min(x),max(x),33);
ylin = linspace(min(y),max(y),33);
%Now use these points to generate a uniformly spaced grid:
[X,Y] = meshgrid(xlin,ylin);
f = scatteredInterpolant(x,y,z);
f.ExtrapolationMethod='none';
%f.Method='nearest';
Z = f(X,Y);
figure
surf(X,Y,Z) %interpolated
axis tight; hold on
%plot3(x,y,z,'.','MarkerSize',15) %nonuniform
if flag
  xlabel('alpha')
  ylabel('gama') 
else
  xlabel('X')
  ylabel('Y')  
end
zlabel('#Steps')
colorbar EastOutside
colormap(jet(5))
end

