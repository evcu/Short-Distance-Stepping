function [ seq2 ] = sequence2SourceRep( seq )
%transformToSourceRepr Calculates source centered parameters
%   SourcePar=[x y angle]
%   Given the trajectory for a target at (0,0) with 90 degree final
%   direction(measured from x-axis, the function calculates new trajectory
%   such that the body trajectory starts from 0,0 and 90 degree angle.
%This first version uses the predefined theoretical source locations
%gathered from targets_ordered.mat file.
close all
subjectHeights = [172,175,185,168,183,176,179,162,175,186,175,188,187,173,175,185,165,169,173,180];
load('.\data\targets\targets_ordered.mat');
h=subjectHeights(seq.subjNo);
sourcePar=double(all_targets(seq.targetNo,:))./[h h 1];
 beta=sourcePar(3)-90;
 alpha=90-sourcePar(3);
 nFrame=size(seq.lTra,1);
 assert((nFrame==size(seq.rTra,1))&&(nFrame==size(seq.bdyTra,1)),'There is a problem');
 alltogether=[seq.bdyTra;seq.lTra;seq.rTra];
 alltogether(:,1)=alltogether(:,1)-sourcePar(1)/186;
 alltogether(:,2)=alltogether(:,2)-sourcePar(2)/186;
 xnew=alltogether(:,1).*cosd(beta)+alltogether(:,2).*sind(beta);
 ynew=-alltogether(:,1).*sind(beta)+alltogether(:,2).*cosd(beta);
 anglenew=alpha+alltogether(:,3);
 xnew=xnew-xnew(1); %Putting the COM into 0,0 at the beginning.
 ynew=ynew-ynew(1);
 allnew=[xnew ynew anglenew];
seq2=seq;
seq2.bdyTra=allnew(1:nFrame,:);
seq2.lTra=allnew(nFrame+1:2*nFrame,:);
seq2.rTra=allnew(2*nFrame+1:end,:);
seq2.targetLoc=rtools.transformToSourceRepr(sourcePar);
end


