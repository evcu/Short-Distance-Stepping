function drawSurfaceTri( x,y,z,flag )
%drawSurfaceTri Summary of this function goes here
%   Detailed explanation goes here
tri = delaunay(x,y);
figure
h = trisurf(tri, x, y, z);
[X,Y] = meshgrid(x,y);
hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
axis tight; hold on
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

