function [regs]=getRegions(targets,TOTAL_RHO_REGION,TOTAL_ALPHA_REGION,TOTAL_GAMA_REGION)
%This function is mainly called by regionStrategyBehaviourReport function.
%The aim is to create trapezoid boxes of the given target map. So it
%gives evenly spaced regions stored in regs. For the regions it uses
%trapezoid regions.
SMALL_NUM=1e-8;
[~, rhos]=cart2pol(targets(:,1),targets(:,2));
rho_intervals=linspace(SMALL_NUM,max(rhos),TOTAL_RHO_REGION+1);
rho_intervals(end)=rho_intervals(end)*2-rho_intervals(end-1);
alpha_intervals=mod(linspace(0,2*pi,TOTAL_ALPHA_REGION+1)-pi/TOTAL_ALPHA_REGION,2*pi);
gama_intervals=mod(linspace(0,360,TOTAL_GAMA_REGION+1)-180/TOTAL_GAMA_REGION,360);
%regs(TOTAL_HORIZONTAL_REGION,TOTAL_VERTICAL_REGION,TOTAL_ANGLE_REGION)=struct('x1',1);
xpoly=zeros(1,4);
ypoly=zeros(1,4);
for i=1:TOTAL_RHO_REGION
    for j=1:TOTAL_ALPHA_REGION
        [xpoly(1),ypoly(1)]=pol2cart(alpha_intervals(j),rho_intervals(i));
        [xpoly(2),ypoly(2)]=pol2cart(alpha_intervals(j),rho_intervals(i+1));
        [xpoly(3),ypoly(3)]=pol2cart(alpha_intervals(j+1),rho_intervals(i+1));
        [xpoly(4),ypoly(4)]=pol2cart(alpha_intervals(j+1),rho_intervals(i));
        for k=1:TOTAL_GAMA_REGION
            temp_reg.xpoly=xpoly;
            temp_reg.ypoly=ypoly;
            temp_reg.ang1=gama_intervals(k);
            temp_reg.ang2=gama_intervals(k+1);
            regs(i,j,k)=temp_reg;
        end
    end
end
end

