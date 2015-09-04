function drawMap( targetnumbers)
%drawFromSource Summary of this function goes here
%   This function draws the target maps with respect to Source and the
%   Target 
%   Use drawDestination2 for only arrows. 
%TODO try one loop
    close all
    load('.\data\targets\targets_ordered.mat')%Loads the target's initial location and direction
    
    %Target at 0,0
    figure;
    plot(0,0,'ro');
    axis([-0.7 0.7 -0.7 0.7]) %Fixes the plot range
    xlabel('Target at 0,0');  
    hold on;
    for i=1:size(targetnumbers,2)
         itest.drawDestination2(double(all_targets(targetnumbers(i),:))./[186 186 1],'r');
    end
    %Source at 0,0
    figure(2);
    plot(0,0,'ro');
    axis([-0.7 0.7 -0.7 0.7]) %Fixes the plot range
    xlabel('Source at 0,0');      
    hold on;
    for i=1:size(targetnumbers,2)
        target=rtools.transformToSourceRepr(double(all_targets(targetnumbers(i),:))./[186 186 1]); %t for target
        itest.drawDestination2(target,'b');
    end
    
end

