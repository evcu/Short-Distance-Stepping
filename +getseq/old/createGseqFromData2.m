function [ gseq_sub2 ] = createGseqFromData2( sub_indices,saveIt,dataNumber )
%createTestSet This funtion loads the subjects and extract some necessary
%information and append a gSeq struct of the sequence
% Input:Indices and flags
% Output: Array of gSeq+ sequences with followin fields
% -seqFeatures
% -charBias
% -gSeq (in source orinted form)
% %%%%%%%%%%%%%%%%%%%%%% %
%     For more information on gSeq look getseq.generateSteps file.
% +gSeq.steps      (n+2)x3 n=totalSteps; 2 for the starting stance.
%steps(1,:)->RT foot  steps(2,:)->LT foot
% +gSeq.stepOrder  1xn
% +gSeq.target    1x3 the starting point for the transform
% gSeq.bTra (n+1)x4
load('./+tra/const.mat','TRAJECTORY_LENGTH');
addpath('./dnew/')
if nargin==1
    saveIt=false;%Default Speed Value
elseif nargin==2
    dataNumber=0;
end
fields2remove={'seqNo','targetNo','subjNo','rTra','lTra','bdyTra','source'...
    ,'StopIndicesLeft','StopIndicesRight','LeftSteps','RightSteps','totalSteps','targetLoc'};
sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices);

for i=1:length(sub)
    seq=sub(i);
   
    stepOrder=regtest.getStepOrder(seq);
    n=length(stepOrder);
  
    temp_gSeq.stepOrder=regtest.getStepOrder(seq);
    assert(~isempty(temp_gSeq.stepOrder),'Hey, It''s me bug');
    rs_indices=logical([1 0 temp_gSeq.stepOrder]);
    temp_gSeq.steps=zeros(length(temp_gSeq.stepOrder)+2,3);
    temp_gSeq.steps(rs_indices,:)=seq.RightSteps;
    temp_gSeq.steps(~rs_indices,:)=seq.LeftSteps;
    temp_gSeq.bTra=tra.sampleTrajectory(seq.bdyTra,TRAJECTORY_LENGTH,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.rTra=tra.sampleTrajectory(seq.rTra,TRAJECTORY_LENGTH,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.lTra=tra.sampleTrajectory(seq.lTra,TRAJECTORY_LENGTH,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.target=rtools.transformToSourceRepr(sub(1,i).source);
    sub(1,i).gSeq=rtools.gSeq2SourceRep(temp_gSeq);
end
gseq_sub2=rmfield(sub,fields2remove);

if saveIt
    save(sprintf('./testSets/gSeqRecordData2%d',dataNumber),'gseq_sub2');
end
end
