function [ out ] = movingAvr( inp,wSize )
%movingAvr requires size(inp,1)>wSize
%   Detailed explanation goes here
    out=ones(size(inp));
    halfWindowSize=floor(wSize/2);
    for i=1:halfWindowSize
        out(i,:)=sum(inp(1:i+halfWindowSize,:),1)./(i+halfWindowSize);
        out(end-i+1,:)=sum(inp(end-halfWindowSize-i+1:end,:),1)./(i+halfWindowSize);
    end
    
    wInd=0:wSize-1;
    for i=1:size(inp,1)-2*halfWindowSize
      %i+halfWindowSize
       out(i+halfWindowSize,:)=sum(inp(wInd+i,:),1)./wSize;
    end
end

