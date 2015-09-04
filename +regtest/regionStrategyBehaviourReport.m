function [sub_categorized,ftrs]=regionStrategyBehaviourReport(sub_indices,saveOn)
%regionBehaviourReport This function gets the cleaned subjects indicated in
%the 'sub_indices' vector and then transforms it into the subject oriented
%representation. Then It creates regions given with the constants below.
%And saves the results into the folder ./regionalStrategiesJpegs
if nargin==1
    saveOn=false;
end
TOTAL_RHO_REGION=5;
TOTAL_ALPHA_REGION=8;
TOTAL_GAMA_REGION=8;
[sub ,ftrs]=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);
sub=rtools.transformSubject(sub);

%generating regions
targets=cat(1,sub(1,:).targetLoc);
regs=regtest.getRegions2(targets,TOTAL_RHO_REGION,TOTAL_ALPHA_REGION,TOTAL_GAMA_REGION);
sub_categorized=cell(size(regs));
f = figure('visible','off');
seqsInRegion=zeros(size(regs));
for i=1:TOTAL_RHO_REGION
    for j=1     :TOTAL_ALPHA_REGION
        for k=1:TOTAL_GAMA_REGION
            axis([-0.7 0.7 -0.7 0.7]) ;
            reg_now=regs(i,j,k);
            out_sub  = regtest.searchCleanSequences2( sub,reg_now,false );
            sub_categorized{i,j,k}=out_sub;
            %             x=regs(TOTAL_RHO_REGION-i+1,j,k).xpoly;
            %             y=regs(TOTAL_RHO_REGION-i+1,j,k).ypoly;
            if saveOn
                for l=1:length(out_sub)
                    clf;
                    regtest.plotReg(reg_now);
                    hold on
                    axis square ;
                    axis([-0.7 0.7 -0.7 0.7]) ;
                    anim.drawSteps2(out_sub(1,l));
                    title(sprintf('%5.3f,',out_sub(1,l).seqFeatures));
                    xlabel(strcat(sprintf('%dth Subject: ',out_sub(1,l).subjNo),sprintf('%5.3f, ',out_sub(1,l).charBias)));
                    saveas(f,sprintf('./regionalStrategiesJpegs/reg-%d-%d-%d-%d.jpg',i,j,k,l));
                end
            end
              seqsInRegion(i,j,k)=size(out_sub,2);
            
        end
    end
end
    regtest.regionReport(regs,seqsInRegion);
    save('./+regtest/regionSeqs/seqCategorized','sub_categorized');
end

