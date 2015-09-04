function [ seq2 ] = sequence2SourceRep2( seq )
%transformToSourceRepr Calculates source centered parameters
%   SourcePar=[x y angle]
%   Given the trajectory for a target at (0,0) with 90 degree final
%   direction(measured from x-axis, the function calculates new trajectory
%   such that the body trajectory starts from 0,0 and 90 degree angle.
% NEWS FEED: It uses .source field of the sequence for transformation
close all
sourcePar=seq.source;
sourcePar(3)=mod(sourcePar(3),360);
 beta=sourcePar(3)-90;
 alpha=90-sourcePar(3);
 nFrame=size(seq.lTra,1);
 assert((nFrame==size(seq.rTra,1))&&(nFrame==size(seq.bdyTra,1)),'There is a problem');
 %Putting the trajectories into one matrix.
 alltogether=[seq.bdyTra;seq.lTra;seq.rTra];
 %calculate the location coordinates from the source perspective
 alltogether(:,1)=alltogether(:,1)-sourcePar(1);
 alltogether(:,2)=alltogether(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew=alltogether(:,1).*cosd(beta)+alltogether(:,2).*sind(beta);
 ynew=-alltogether(:,1).*sind(beta)+alltogether(:,2).*cosd(beta);
 %rotate the directions
 anglenew=alpha+alltogether(:,3);
 
 allnew=[xnew ynew anglenew];
seq2=seq;
seq2.bdyTra=allnew(1:nFrame,:);
seq2.lTra=allnew(nFrame+1:2*nFrame,:);
seq2.rTra=allnew(2*nFrame+1:end,:);
seq2.targetLoc=rtools.transformToSourceRepr(sourcePar);
seq2.source=[0 0 -1];
        seq2.LeftSteps=seq2.lTra(seq.StopIndicesLeft,:);
        seq2.RightSteps=seq2.rTra(seq.StopIndicesRight,:);
end


