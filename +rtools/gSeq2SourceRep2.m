function [ gSeq2 ] = gSeq2SourceRep2( gSeq )
%gSeq2SourceRep USELESS FROM NOW ONE. MAY BE DELETED
sourcePar=rtools.transformToSourceRepr(gSeq.target);
sourcePar(3)=mod(sourcePar(3),360);
 beta=sourcePar(3)-90;
 alpha=90-sourcePar(3);

 %calculate the location coordinates from the source perspective
 gSeq.steps(:,1)=gSeq.steps(:,1)-sourcePar(1);
 gSeq.steps(:,2)=gSeq.steps(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew=gSeq.steps(:,1).*cosd(beta)+gSeq.steps(:,2).*sind(beta);
 ynew=-gSeq.steps(:,1).*sind(beta)+gSeq.steps(:,2).*cosd(beta);
 %rotate the directions
 anglenew=alpha+gSeq.steps(:,3);
 allnew=[xnew ynew anglenew];
 
 bdy=gSeq.bTra;  
  %calculate the location coordinates from the source perspective
 bdy(:,1)=bdy(:,1)-sourcePar(1);
 bdy(:,2)=bdy(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew2=bdy(:,1).*cosd(beta)+bdy(:,2).*sind(beta);
 ynew2=-bdy(:,1).*sind(beta)+bdy(:,2).*cosd(beta);
 %rotate the directions
 angle2new=alpha+bdy(:,3);
 allnew2=[xnew2 ynew2 angle2new];
gSeq2=gSeq;
gSeq2.steps=allnew;
gSeq2.bTra=allnew2;
end


