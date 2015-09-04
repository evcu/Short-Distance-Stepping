function [ err ] = getDistanceAngleError(s1,s2 ) %s for Step
%getError gets (x,y,gama) and returns distance,dGama
    dist=ppro.getDistance(s1(1,1:2),s2(1,1:2));
    ang=ppro2.getAngleDiff(s1(1,3:4),s2(1,3:4));
    err=[ang;dist];
end

