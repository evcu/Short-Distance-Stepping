function regionReport(regs,results)
%regionReport This function gets the regions and the total number of
%sequences in the regions and plot the results in k different picture for k
%different gama

TOTAL_RHO_REGION=size(regs,1);
TOTAL_ALPHA_REGION=size(regs,2);
TOTAL_GAMA_REGION=size(regs,3);
f = figure('visible','on');

for k=1:TOTAL_GAMA_REGION
    clf;
    axis([-0.7 0.7 -0.7 0.7]) ;
    axis square ;
    hold on
    for i=1:TOTAL_RHO_REGION
        for j=1:TOTAL_ALPHA_REGION
            reg_now=regs(i,j,k);
            regtest.plotReg(reg_now,results(i,j,k));
        end     
    end 
saveas(f,sprintf('./regionalStrategiesJpegs/regReport%d.jpg',k));
end
end

