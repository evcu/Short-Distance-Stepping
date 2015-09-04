function [ rsteps,lsteps ] = getStepIndices( seq )
%getSteps Gives the location of the Steps with direction, using speed and
%distance threshold
%Input=diff(footSequence)
%TODO to speed up Accuracy argument can be added by factoring for-loop variable
%Which is basically moving average window size
MIN_STEP_ENDING_FRAME=25;
%TODO one can separete duration consraints for stepping and stopping.
MIN_STOPPING=50;
StepStartingThreshold=0.2/1000;  %Increase this if one wants to ignore adjustment steps...
    [sdr, sdl]=ppro.getSpeeds(seq);
 r_belowThresholdIndices=sdr<StepStartingThreshold;
    k=1;
    r_beginning=find(r_belowThresholdIndices==1,1); %Sometimes record starts with the subject moving. So to cancel this I started looking for steps once the foot is still
    step_start_at=-1;
    isStepping=false;
    isStationary=true;
    isStepRecorded=false;
    for i=r_beginning:size(sdr,1)
        if ~r_belowThresholdIndices(i)&&isStationary
           %fprintf('Foot start moving at %d\n',i);
            isStationary=false;
            step_start_at=i;
            if MIN_STOPPING<(i-r_beginning)&&~isStepRecorded; %To be a step, it must stay there for at least MIN_FRAME 
            %fprintf('Step detected at %d\n',i);
            rsteps(k)=int32((r_beginning+i)/2);
            k=k+1;
            isStepRecorded=true;
            end
        end
         if ~r_belowThresholdIndices(i)&&~isStepping&&(MIN_STEP_ENDING_FRAME<(i-step_start_at))
            %fprintf('Foot start stepping at %d.And detected at %d\n',step_start_at,i);
            isStepping=true;
            isStepRecorded=false;
         end
         if r_belowThresholdIndices(i)&&isStepping
            %fprintf('Stepping stooped at %d\n',i);
            isStationary=true;
            r_beginning=i;  
            isStepping=false;
         end
         if r_belowThresholdIndices(i)&&~isStationary
            %fprintf('Moving stooped at %d\n',i);
            isStationary=true;
         end
    end
    if r_belowThresholdIndices(end)&&~isStepping&&~isStepRecorded
        %fprintf('Step detected at the end %d\n',i);
        rsteps(k)=int32((r_beginning+size(sdr,1))/2);
    end
    
    l_belowThresholdIndices=sdl<StepStartingThreshold;
    k=1;
    l_beginning=find(l_belowThresholdIndices==1,1); %Sometimes record starts with the subject moving. So to cancel this I started looking for steps once the foot is still
    step_start_at=-1;
    isStepping=false;
    isStationary=true;
    isStepRecorded=false;
    for i=l_beginning:size(sdl,1)
        if ~l_belowThresholdIndices(i)&&isStationary
           % fprintf('Foot start moving at %d\n',i);
            isStationary=false;
            step_start_at=i;
            if MIN_STOPPING<(i-l_beginning)&&~isStepRecorded; %To be a step, it must stay there for at least MIN_FRAME 
            %fprintf('Step detected at %d\n',i);
            lsteps(k)=int32((l_beginning+i)/2);
            k=k+1;
            isStepRecorded=true;
            end
        end
         if ~l_belowThresholdIndices(i)&&~isStepping&&(MIN_STEP_ENDING_FRAME<(i-step_start_at))
           % fprintf('Foot start stepping at %d\n',step_start_at);
            isStepping=true;
            isStepRecorded=false;
         end
         if l_belowThresholdIndices(i)&&~isStationary
            %fprintf('Moving stooped at %d\n',i);
            isStationary=true;
            l_beginning=i;  
            isStepping=false;
         end
         if l_belowThresholdIndices(i)&&~isStationary
            %fprintf('Moving stooped at %d\n',i);
            isStationary=true;
         end
    end
    if l_belowThresholdIndices(end)&&~isStepping&&~isStepRecorded
        %fprintf('Step detected at the end %d\n',i);
        lsteps(k)=int32((l_beginning+size(sdl,1))/2);
    end
end

