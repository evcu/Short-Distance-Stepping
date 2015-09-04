function drawMap2( sub)
%drawFromSource Summary of this function goes here
%   This function draws clean subjects .targetLoc fields colored according
%   to the direction angle.
%   Use drawDestination2 for only arrows. 
%TODO try one loop
    close all
    %Target at 0,0
    figure;
    plot(0,0,'ro');
    axis([-0.5 0.5 -0.5 0.5]) %Fixes the plot range
    xlabel('Source at 0,0');  
    hold on;
    for i=1:size(sub,2)
        target=sub(i).targetLoc;
        a=abs(target(3));
        b=target(3);
        if(a<22.5)
            anim.drawDestination(target,[0 1 1]);
        elseif (a>22.5)&&(a<67.5)
            if b>0
                anim.drawDestination(target,[1 0 1]);
            else
                anim.drawDestination(target,[1 0 0]);
            end
        elseif (a>67.5)&&(a<112.5)
            if b>0
                anim.drawDestination(target,[0 1 0]);
            else
                anim.drawDestination(target,[0 0 1]);
            end
        elseif (a>112.5)&&(a<157.5)
            if b>0
                anim.drawDestination(target,[0 0 0]);
            else
                anim.drawDestination(target,[1 0.5 0.8]);
            end
        elseif (a>157.5)
            anim.drawDestination(target,[0.5 0.3 1]);
            
        end
        
    end
end

