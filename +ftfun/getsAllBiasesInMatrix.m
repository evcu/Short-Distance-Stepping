%Gets all biases as 4*12 matrix.
 clear all

for i=8:20
    sub=ppro2.loadAndMergeSubjects(i);
    bias(:,i-7)=ftfun.getBiases(sub);
end
min=1;
for i=1:13
    for j=i+1:13
        d=sqrt(sum(abs(bias(:,i)-bias(:,j)).^2));
        if d<min
            last=[i j];
            min=d;
        end
    end
end