eval(sprintf('load(''./dnew/cuts/cut%d'',''cuts'');',subNo));
for i=1:size(cuts,2)
   seq=sub(cuts(1,i));
   seq2=ppro.getSubSequence(seq,cuts(2,i):size(seq.lTra,1));
   sub(cuts(1,i))=seq2;
end

eval(sprintf('load(''./dnew/accuracy/accuracy%d'',''accuracy'');',subNo));
sub=sub(accuracy~=0);

%eval(sprintf('subject%d=sub',subNo));
%eval(sprintf('save(''./dclean/subject%d'',''sub'');',subNo));