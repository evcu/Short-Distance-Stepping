function drawStance( twoFeet,isMonochrome,drawFun)
%drawStance This function get 8xm vector and splits it into two. Which are 
%right&left foot locations respectively.
if nargin==1
   isMonochrome=false; 
end

if isMonochrome
rclr='k';
lclr='k';  
else
rclr='r';
lclr='b';
end
assert(sum(size(twoFeet)==[8 1])==2,'BUG IN DRAW STANCE');
rfoot=rtools.vec2ang(twoFeet(1:4)');
drawFun(rfoot,1,rclr);
lfoot=rtools.vec2ang(twoFeet(5:end)');
drawFun(lfoot,0,lclr);
end

