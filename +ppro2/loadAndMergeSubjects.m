function [ subout ] = loadAndMergeSubjects( indices )
%loadAndMergeSubjects load subjects from ./dclean/ dir and then returns
%them as a single sequence array.
subout=[];
for i=1:length(indices)
   load(sprintf('./dclean/subject%d',indices(i)));
   subout=[subout sub];
end
end

