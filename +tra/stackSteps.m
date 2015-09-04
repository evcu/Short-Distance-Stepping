function [ x ] = stackSteps( rs,ls,isRT,stackPerFoot )
%stackSteps This function gets Rt and Lt step locations and produces a
%stacked vector from them.
% rs:n*3
% ls:m*3
% isRT:0->LT|1->RT
% stackPerFoot(pf): an integer such that n,m<pf
% Output: (stackPerFoot*4*2+4)x1 vector the last 3 element is total steps
% in binary form
pf=stackPerFoot;
n=size(rs,1);
m=size(ls,1);
%Checking the step size and clipping, such that starting foot has 5 stance
%other one for such that total steps are 7 and can be represented as 3
%digit binary.
if isRT
    if n>pf
        rs(pf+1:n,:)=[];
        n=pf;
    end
    if m>pf
        ls(pf:m,:)=[];
        m=pf-1;
    end
else
    if n>pf
        rs(pf:n,:)=[];
        n=pf-1;
    end
    if m>pf
        ls(pf+1:m,:)=[];
        m=pf;
    end
end

binaryTotalStep=dec2bin(m+n-2, 3)-'0';

rs_vec=rtools.ang2vec(rs);
rs_vec(n+1:pf,:)=repmat(rs_vec(n,:),pf-n,1);
ls_vec=rtools.ang2vec(ls);
ls_vec(m+1:pf,:)=repmat(ls_vec(m,:),pf-m,1);
x=[reshape(rs_vec',4*pf,1);reshape(ls_vec',4*pf,1);isRT;binaryTotalStep'];
end

