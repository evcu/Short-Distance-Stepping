function [ targetPar ] = transformToSourceRepr( sourcePar )
%transformToSourceRepr Calculates source centered parameters
%   SourcePar=[x y angle]
%   Given source parameters for a target at (0,0) with 90 degree final
%   direction(measured from x-axis, the function calculates the source
%   centered(source at (0,0) with 90degrees orientation) target
%   parameters(x,y,angle)
 beta=sourcePar(:,3)-90;
 xnew=-sourcePar(:,1).*cosd(beta)-sourcePar(:,2).*sind(beta);
 ynew=sourcePar(:,1).*sind(beta)-sourcePar(:,2).*cosd(beta);
 anglenew=180-sourcePar(:,3);
 targetPar=[xnew ynew anglenew];
end

