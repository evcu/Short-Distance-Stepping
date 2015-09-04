function [ subout,ftrs ] = loadAndMergeSubjectsWithFeatures( indices,indices2ignore )
%loadAndMergeSubjects load subjects from ./dclean/ dir and then returns
%them as a single sequence array with features extracted from 
%i==indices2ignore are ignored.
if nargin==1
   indices2ignore=[]; 
end
subout=[];
n=length(indices);
ftrs=[];
for i=1:n
   sub=ppro2.loadAndMergeSubjects(indices(i));
   [sub ,fts] =ftfun.getFeatures2(sub);
   [bias ,~]=ftfun.getBiases(sub);
   [sub.charBias]=deal(bias);
   ftrs=[ftrs ; fts];
   subout=[subout sub];
end
    ftrs(indices2ignore,:)=[];
    subout(:,indices2ignore)=[];
end

