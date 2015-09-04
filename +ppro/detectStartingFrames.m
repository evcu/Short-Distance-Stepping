function [ sub2,check ] = detectStartingFrames( sub )
%detectStartingFrames This function gets a sequence array and add starting
%location and direction to the sequence struct, which is a vector of 3 variables
%[x y angle]. It uses the the first two stance locations and averages them.
sub2=sub;
check=ones(size(sub,2),3);
    for i=1:size(sub,2)  
        seq=sub(i);
          ld=seq.LeftSteps(1,:);
          rd=seq.RightSteps(1,:);
          check(i,1)=ld(3);
          check(i,2)=rd(3);
    if abs(ld(3)-rd(3))>90 %Assuption: The difference is small at the beginning.
       if ld(3)>0
            rd(3)=mod(rd(3),360);
       else
            ld(3)=mod(ld(3),360);
       end
    end
    sub2(i).source=(ld+rd)/2;
    check(i,3)=sub2(i).source(3);
    end
end

