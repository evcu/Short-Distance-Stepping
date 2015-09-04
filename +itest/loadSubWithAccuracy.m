%Loads the written subjects data.
clear all
subNo=input('Subject?\n');
addpath('./dnew/')
eval(sprintf('load subject%d',subNo));
eval(sprintf('load(''./dnew/accuracy/accuracy%d'')',subNo));