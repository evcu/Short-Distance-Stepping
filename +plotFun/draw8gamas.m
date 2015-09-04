function draw8gamas(sub_ind)

out2=plotFun.getNumberOfStepsMatrixInCartesian(plotFun.cleanAndTransform(sub_ind));
% [B,I] = sort(out2(:,3),1);
% out2=out2(I,:);
% x=out2(:,1);
% y=out2(:,2);
% z=out2(:,4);

a=abs(out2(:,3));
b=out2(:,3);

i=a<22.5;
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama 0 : [-22.5 22.5]');
saveas(gcf,'./gamapics/gama0.png')
close

 i= (a>22.5)&(a<67.5)&(b>0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama 45 :[22.5 67.5]');
saveas(gcf,'./gamapics/gama45.png')
close

 i= (a>22.5)&(a<67.5)&(b<0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama -45 :[-22.5 -67.5]');
saveas(gcf,'./gamapics/gama-45.png')
close

 i= (a>67.5)&(a<112.5)&(b>0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama 90 :[67.5 112.5]');
saveas(gcf,'./gamapics/gama90.png')
close

 i= (a>67.5)&(a<112.5)&(b<0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama -90 :[-67.5 -112.5]');
saveas(gcf,'./gamapics/gama-90.png')
close

 i= (a>112.5)&(a<157.5)&(b>0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama 135 :[112.5 157.5]');
saveas(gcf,'./gamapics/gama135.png')
close

 i= (a>112.5)&(a<157.5)&(b<0);
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama -135 :[-112.5 -157.5]');
saveas(gcf,'./gamapics/gama-135.png')
close

 i= a>157.5;
out_subset=out2(i,:);
plotFun.drawColoredVoronoi(out_subset);
title('Gama 180 :[-157.5 157.5]');
saveas(gcf,'./gamapics/gama180.png')

end
     