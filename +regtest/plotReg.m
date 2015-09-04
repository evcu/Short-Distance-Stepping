function plotReg( reg,num)
%plotReg Draws the region between the radius r1-r2 and between angle a1-a2.
if nargin==1
    num=NaN;
end
a1=reg.alpha1;
r1=reg.rho1;
a2=reg.alpha2;
r2=reg.rho2;
if a1>a2
    t = linspace(a1-2*pi,a2);
else
    t = linspace(a1,a2);
end


r = linspace(r1,r2);
x1 = r1*cos(t) ;
y1 = r1*sin(t) ;
x2 = r*cos(a2) ;
y2 = r*sin(a2) ;
x3 = r2*cos(fliplr(t)) ;
y3 = r2*sin(fliplr(t)) ;
x4 = fliplr(r)*cos(a1) ;
y4 = fliplr(r)*sin(a1) ;
x = [x1 x2 x3 x4];
y = [y1 y2 y3 y4];
fill(x,y,[1 1 1]);
if ~isnan(num)
    if a1>a2
        a1=a1-2*pi;
    end
    ang=(a1+a2)/2;
    rho=(r1+r2)/2;
    g1=reg.gama1;
    g2=reg.gama2;
    if g1>g2
        g1=g1-360;
    end
    gama=(g1+g2)/2;
   [ptx,pty]=pol2cart(ang,rho);
   anim.drawDestination2([ptx pty gama],num,'r'); 
end

end
