function [ param_out ] = transform2polar( param )
%piInterval This function transform the cartesian input into the polar
%coordinates and the angle into [-pi pi] interval of the n*3
%matrix consists of row vectors [x y angle]
angle=param(:,3);
angle(angle>180)=angle(angle>180)-360;
angle(angle<-180)=angle(angle<-180)+360;
assert(numel(angle(angle<-180|angle>180))==0,'UPS angle=%f',angle);
new_angle=(angle./360).*(2*pi);
%[alpha,d]=cart2pol(param(:,1),param(:,2));
param_out=[param(:,1) param(:,2) new_angle];
end

