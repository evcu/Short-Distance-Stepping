function [res]=checkAngles( sub,indexes_asked )
%checkAngles This code is written for investigating the tranformation angle
%whether it should be body starting direction recorded or the average feet
%orientation.
close all;
load('.\data\targets\targets_ordered.mat')
res=zeros(386,3);

for i=1:size(indexes_asked,2)
    %For saving and investigating. From here to
    seqNo=indexes_asked(i);
    seq=sub(seqNo);
    [rsteps, lsteps]=ppro.getStepIndices(seq);
    res(seqNo,1)=mod(all_targets(seq.targetNo,3),360);
   res(seqNo,2)=mod(res(seqNo,1)-mod(seq.bdyTra(1,3),360),360);
   if res(seqNo,2)>180
      res(seqNo,2)=abs(res(seqNo,2)-360);
   end
   ld=seq.lTra(lsteps(1),3);
   rd=seq.rTra(rsteps(1),3);
    if abs(ld-rd)>90 %Assuption: The difference is small at the beginning.
       if ld>0
            rd=rd+360;
       else
            ld=ld+360;
       end
    end
   res(seqNo,3)=mod(res(seqNo,1)-mod((ld+rd)/2,360),360);
   if res(seqNo,3)>180
      res(seqNo,3)=abs(res(seqNo,3)-360);
   end
end
end

