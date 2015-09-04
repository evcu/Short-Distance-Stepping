function [ gseq_sub ] = createGseqFromData0( sub_indices,i2ignore,saveIt,dataNumber )
%createGseqFromData0 Creates Gseq from data ready to use in the gui.
%Version0 uses fixed time sampling. 
load('./+tra/const.mat','TRAJECTORY_LENGTH','SAMPLING_PERIOD','STACK_PER_TRAJECTORY');
addpath('./dnew/')
if nargin==1
    i2ignore=[];%Default Speed Value
    saveIt=false;
elseif nargin==2
    saveIt=false;
elseif nargin==3
    dataNumber=0;
end
fields2remove={'seqNo','targetNo','subjNo','rTra','lTra','bdyTra','source'...
    ,'StopIndicesLeft','StopIndicesRight','LeftSteps','RightSteps','totalSteps','targetLoc'};
if isnumeric(sub_indices)
    sub=regtest.loadAndMergeSubjectsWithFeatures(sub_indices,i2ignore);
else
    display('Hey. You saved some time. Congrats!createGseq');
    sub=sub_indices;
end
for i=1:length(sub)
    seq=sub(i);
    temp_gSeq.stepOrder=regtest.getStepOrder(seq);
    assert(~isempty(temp_gSeq.stepOrder),'Hey, It''s me bug');
    rs_indices=logical([1 0 temp_gSeq.stepOrder]);
    temp_gSeq.steps=zeros(length(temp_gSeq.stepOrder)+2,3);
    temp_gSeq.steps(rs_indices,:)=seq.RightSteps;
    temp_gSeq.steps(~rs_indices,:)=seq.LeftSteps;
    temp_gSeq.bTra=tra.sampleTrajectory0(seq.bdyTra,SAMPLING_PERIOD,STACK_PER_TRAJECTORY,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.rTra=tra.sampleTrajectory0(seq.rTra,SAMPLING_PERIOD,STACK_PER_TRAJECTORY,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.lTra=tra.sampleTrajectory0(seq.lTra,SAMPLING_PERIOD,STACK_PER_TRAJECTORY,double([seq.StopIndicesRight seq.StopIndicesRight]),0);
    temp_gSeq.target=rtools.transformToSourceRepr(sub(1,i).source);
    sub(1,i).gSeq=rtools.gSeq2SourceRep(temp_gSeq);
end
gseq_sub=rmfield(sub,fields2remove);

if saveIt
    save(sprintf('./testSets/gSeqRecordData%d',dataNumber),'gseq_sub');
end
end
