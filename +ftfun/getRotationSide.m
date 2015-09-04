function [ bias ] = getRotationSide( seqs )
%getRotationSide Given array of sequence structs it calculates the
%starting foot bias. Left counts 0 right counts 1 and then average count 
%is calculated. For example 1 bias means->always right

%RotationSide Determination
%sd=|gamaSource-gamaFirstStep-90|  sd<90 ? 1 (Right) : 0 (Left)
sum=0;
for i=1:length(seqs)
   seq=seqs(i);
   if seq.StopIndicesLeft(2)<=seq.StopIndicesRight(2)
      gamaFirstStep=mod(seq.LeftSteps(2,3),360);
   else
      gamaFirstStep=mod(seq.RightSteps(2,3),360); 
   end
   gamaSource=mod(seq.source(3),360); %For debugging
   sd=abs(gamaSource-gamaFirstStep-90);
   sum=sum+(sd<90);
end
bias=sum/i;
end

