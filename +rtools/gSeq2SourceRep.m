function [ gSeq2 ] = gSeq2SourceRep( gSeq )
%gSeq2SourceRep TODO
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
 gSeq2=gSeq;
 gSeq2.steps=allnew;
if isfield(gSeq,'bTra')
   gSeq.bTra(:,1)=gSeq.bTra(:,1)-sourcePar(1);
 gSeq.bTra(:,2)=gSeq.bTra(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew2=gSeq.bTra(:,1).*cosd(beta)+gSeq.bTra(:,2).*sind(beta);
 ynew2=-gSeq.bTra(:,1).*sind(beta)+gSeq.bTra(:,2).*cosd(beta);
 %rotate the directions
 angle2new=alpha+gSeq.bTra(:,3); %This for both body and tangent direction
 allnew2=[xnew2 ynew2 angle2new];
gSeq2.bTra=allnew2; 
end

if isfield(gSeq,'rTra')
   gSeq.rTra(:,1)=gSeq.rTra(:,1)-sourcePar(1);
 gSeq.rTra(:,2)=gSeq.rTra(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew2=gSeq.rTra(:,1).*cosd(beta)+gSeq.rTra(:,2).*sind(beta);
 ynew2=-gSeq.rTra(:,1).*sind(beta)+gSeq.rTra(:,2).*cosd(beta);
 %rotate the directions
 angle2new=alpha+gSeq.rTra(:,3); %This for both body and tangent direction
 allnew2=[xnew2 ynew2 angle2new];
gSeq2.rTra=allnew2; 
end

if isfield(gSeq,'lTra')
   gSeq.lTra(:,1)=gSeq.lTra(:,1)-sourcePar(1);
 gSeq.lTra(:,2)=gSeq.lTra(:,2)-sourcePar(2);
 %rotate the coordinate system
 xnew2=gSeq.lTra(:,1).*cosd(beta)+gSeq.lTra(:,2).*sind(beta);
 ynew2=-gSeq.lTra(:,1).*sind(beta)+gSeq.lTra(:,2).*cosd(beta);
 %rotate the directions
 angle2new=alpha+gSeq.lTra(:,3); %This for both body and tangent direction
 allnew2=[xnew2 ynew2 angle2new];
gSeq2.lTra=allnew2; 
end


end


