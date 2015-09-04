function [ difr ] = getAngleDifference( a1,a2,isSmall )
%getAngleDiff calculates the absolute value of angle difference between two angles 
%returns the short way if isSmall, otherwise returns the bigger way.
difr=abs(a1-a2);
if difr>180
   difr=360-difr; 
end
if ~isSmall
   difr=360-difr;
end

end

