function drawColoredVoronoi( out_subset )
%UNTÝTLED5 Summary of this function goes here
%   Detailed explanation goes here
extra=[-0.5 -0.5 0 20;-0.5 0.5 0 20;0.5 -0.5 0 20;0.5 0.5 0 20];
cmap = colormap(jet(6));
out_subset=[out_subset;extra];
x=out_subset(:,1);
y=out_subset(:,2);
z=out_subset(:,4);
z(z>5)=5;
figure;
[v,c] = voronoin([x y]);
for i = 1:length(c)
if all(c{i}~=1)   % If at least one of the indices is 1,
% then it is an open region and we can't
% patch that.
patch(v(c{i},1),v(c{i},2),cmap(z(i)+1,:)); % use color i.
end
end
%nsteps=getTheClosest(x,y,out_subset);
%surf(x,y,nsteps,'EdgeColor','None');
%view(2); 
  xlabel('X');
  ylabel('Y') ;
axis([-0.5 0.5 -0.5 0.5]);
colormap(cmap)
colorbar EastOutside;
tcks=linspace(0.0833,0.9167,6);
colorbar('Ticks',tcks,...
'TickLabels',{'0','1','2','3','4','5'})
hold on
voronoi(x,y);



end

