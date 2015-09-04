function [ difr ] = getAngleDiff( a1,a2 )
%getAngleDiff Gets the absolute value of the angle difference between two
%unit angle vector a1 a2 which are 1*2 vectors: [x y]
%Input a1,a2: unit direction vectors
%Output difr: 0-180 in degrees.
    CosTheta = dot(a1,a2)/(norm(a1)*norm(a2 ));
    difr = acos(CosTheta)*180/pi;
end

