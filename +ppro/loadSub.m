%Loads the written subjects data.
clear all
subNo=input('Subject?\n');
addpath('./dnew/')
eval(sprintf('load subject%d',subNo));
%eval(sprintf('sub=subject%d',subNo));
%eval(sprintf('clear subject%d',subNo));
% seqNo=input('seq?\n');
% if seqNo~=0
%    prep_seqNo; 
% end