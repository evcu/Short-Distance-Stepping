function cleanAndSave( sub_indices )
%cleanAndSave Given cuts and accuracy information generated with
%testAccuracyManually script. This function process the subjects such that
%the data is ready to use. The resulting sequence-struct array have
%following fields:
%     seqNo    
%     targetNo 
%     subjNo
%     rTra
%     lTra
%     bdyTra
%     StopIndicesLeft
%     StopIndicesRight
%     LeftSteps
%     RightSteps
%     totalSteps
%     targetLoc
%     source
addpath('./dnew/')
for i=1:length(sub_indices)
    subNo=sub_indices(i);
    eval(sprintf('load subject%d',subNo));
    ppro.cleanSequences;
    sub2=ppro.detectSteps(sub);
    clear sub;
    [sub , ~]=ppro.detectStartingFrames(sub2);
    eval(sprintf('save(''./dclean/subject%d'',''sub'');',subNo));
end
end