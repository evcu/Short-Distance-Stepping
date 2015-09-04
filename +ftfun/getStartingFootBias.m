function [ bias ] = getStartingFootBias( seqs )
%getStartingFootBias Given array of sequence structs it calculates the
%starting foot bias. Left counts 0 right counts 1 and then average count 
%is calculated. For example 1 bias means->always right
sum=0;
for i=1:length(seqs)
   seq=seqs(i);
   if seq.StopIndicesRight(2)<=seq.StopIndicesLeft(2)
      sum=sum+1;
   end
end
bias=sum/i;
end

