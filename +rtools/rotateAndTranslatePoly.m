function pS = rotateAndTranslatePoly( polyStruct,param )
%rotateAndTranslatePoly This fucntion gets a poly struct consist of 'x' 'y'
%fields for edge coordinates. param is regular [x y angle] triplet. This
%function first rotates the step by param(3) and then translate it to the
%param(1:2);
X=polyStruct.x;
Y=polyStruct.y;
pS.x = cosd(param(3)) * X - sind(param(3)) * Y+param(1);
pS.y = sind(param(3)) * X + cosd(param(3)) * Y+param(2);

end
