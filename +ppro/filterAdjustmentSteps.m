function [ sub2 , changed ] = filterAdjustmentSteps( sub )
%filterAdjustmentSteps This function gets a sequence array 
%To adjust it one can use animateFilteredSequences.
%TODO This function is NOT WORKING FINE. One need to update this with better
%algorihm. To delete ALL adjustment steps safely.
DISTANCE_THRESHOLD=0.020;
ANGLE_THRESHOLD=10; %-+10
sub2=sub;
changed=zeros(4,size(sub,2));
    for i=1:size(sub,2)     
        seq=sub(i);
        rsteps=seq.RightSteps;
        lsteps=seq.LeftSteps;
        for j=1:size(rsteps,1)-1
            p1=rsteps(j,:);
            p2=rsteps(j+1,:);
            dist=ppro.getDistance(p1(1:2),p2(1:2));
            anglediff=abs(p1(3)-p2(3));
            if dist<DISTANCE_THRESHOLD&&anglediff<ANGLE_THRESHOLD;
               fprintf('Adjustment detected at right at i=%d j=%d\n',i,j);
               seq.RightSteps(j+1,:)=[];
               seq.StopIndicesRight(j+1)=[];
               seq.totalSteps=seq.totalSteps-1;
               changed(2,i)=1;
               changed(4,i)=dist;
                break;
            end
        end
         for j=1:size(lsteps,1)-1
            p1=lsteps(j,:);
            p2=lsteps(j+1,:);
            dist=ppro.getDistance(p1(1:2),p2(1:2));
            anglediff=abs(p1(3)-p2(3));
            if dist<DISTANCE_THRESHOLD&&anglediff<ANGLE_THRESHOLD;
               fprintf('Adjustment detected at left at i=%d j=%d\n',i,j);
               seq.LeftSteps(j+1,:)=[];
               seq.StopIndicesLeft(j+1)=[];
               seq.totalSteps=seq.totalSteps-1;
               changed(1,i)=1;
                changed(3,i)=dist;
               break;
            end
         end
        sub2(i)=seq;
    end
end

