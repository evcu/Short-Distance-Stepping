function [ h ] = createTrajectoryQuiver( trajectory,ARROW_LENGTH,clr )
%UNTÝTLED4 Summary of this function goes here
%   Detailed explanation goes here
iangle=trajectory(1,3);
u = cosd(iangle)*ARROW_LENGTH;
v = sind(iangle)*ARROW_LENGTH;
h = quiver(trajectory(1,1),trajectory(1,2),u,v,'go','AutoScale','off','LineWidth',2,'Color',clr,...
                   'YDataSource','Y','XDataSource','X','UDataSource','U','VDataSource','V');
end

