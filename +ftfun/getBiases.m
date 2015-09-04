function [ bias,seqUsed ] = getBiases( sub,saveOn )
%getBiases This function gets the sequences in front and at the back of the
%subject and then determine its bias about starting foot preference. Left
%counts 0 right counts 1 and then average count is calculated. For example 1
%bias means->always right

%bias vector is 4x1 vector with
% 1-ForwardStart
% 2-BackwardStart
% 3-ForwardRotationSide
% 4-BackwardRotationSide
bias=zeros(4,1);
%seqUsed is 4x1 cell with each cell contains seq array used to determine
%the bias.
seqUsed=cell(4,1);

if nargin==1
    saveOn=false;
end

c=(180/pi);
reg.rho1=0.05; %To eliminate standing sequence. Which has not any step.
reg.rho2=1;
reg.alpha1=75/c;
reg.alpha2=105/c;
reg.gama1=75;
reg.gama2=105;
seqUsed{2}=regtest.searchCleanSequences2( sub,reg,false );
reg.alpha1=250/c;
reg.alpha2=290/c;
seqUsed{1}=regtest.searchCleanSequences2( sub,reg,false );
reg.gama1=255;
reg.gama2=285;
seqUsed{4}=regtest.searchCleanSequences2( sub,reg,false );
reg.alpha1=75/c;
reg.alpha2=105/c;
seqUsed{3}=regtest.searchCleanSequences2( sub,reg,false );

bias(1)=ftfun.getStartingFootBias(seqUsed{1});
bias(2)=ftfun.getStartingFootBias(seqUsed{2});
bias(3)=ftfun.getRotationSide(seqUsed{3});
bias(4)=ftfun.getRotationSide(seqUsed{4});


if saveOn
    f = figure('visible','off');
    subN=sub(1).subjNo;
    for i=1:length(seqUsed)
        seqs=seqUsed{i};
        for j=1:length(seqs)
        clf;
        hold on
        axis square ;
        axis([-0.7 0.7 -0.7 0.7]) ;
        anim.drawSteps2(seqs(j));
        title(sprintf('Bias(%d): %.2f',i,bias(i)));
        xlabel(sprintf('%dth Subject,',subN));
        saveas(f,sprintf('./+ftfun/biasSeqs/Sub%d-%d-%d.jpg',subN,i,j));
        end
    end
end
end


