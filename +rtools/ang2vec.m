function [ out ] = ang2vec( triple )
%ang2vec This function transforms triple(:,3) angle into the representetive
%unit vector.
gama=triple(:,3);
out=[triple(:,1:2) cosd(gama) sind(gama)];

end
