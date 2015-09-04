function [ dist ] = getDistance( p1,p2 )
%getDistance p1,p2 are 1x2 x-y points
    difr=(p1-p2).^2;
    dist=sqrt(sum(difr));
end

