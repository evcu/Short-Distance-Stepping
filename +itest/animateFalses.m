%animateFalses Animated a group of sequences one by one given by @indices
%   I'm going to use it to animate falses.
%TODO needed to be fixed such that it loads the accuracy 
if input('1-LoadData 0-AlreadLoaded\n')
    addpath('./dnew/')
    itest.loadSubWithAccuracy;
end
ind=find(accuracy==0);
for i=1:size(ind,2)
    anim.animateSteps(sub(ind(i)));  
end

