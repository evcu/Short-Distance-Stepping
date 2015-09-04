function getAllSequences()
%getAllSequences Reads the sequence data from ./data/sequences/
%and saves it in to ./dnew/ as subject#No in TARGET NUMBER ORDER.
%Original sequence numbers are kept in the field seqNo/
%Longest sequence has 5546 frame
%It also normalizes the trajectories with the height of the person.
%Also prints the ranges for the location.
%  for j=1:20
%      fprintf('%dth Subjecton fire\n',j);
%TODO do it general for any subject by using eval
subjectHeights = [172,175,185,168,183,176,179,162,175,186,175,188,187,173,175,185,165,169,173,180] .* 10;
for i=1:20
    load(strcat('.\data\targets\targets_rev_index_',int2str(i),'.mat'));
    k=1;
    for j=1:359
        %       try
        load(strcat('.\data\sequences\',int2str(i),'\sequence_',int2str(rev_index(j,1)),'.mat')); %Loads the proper sequence
        subjects(i,k).seqNo=sequenceNumber;
        subjects(i,k).targetNo=j;
        subjects(i,k).subjNo=i;
        subjects(i,k).rTra=bsxfun(@rdivide, sequenceObj.rightFootTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        subjects(i,k).lTra=bsxfun(@rdivide, sequenceObj.leftFootTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        subjects(i,k).bdyTra=bsxfun(@rdivide, sequenceObj.bodyTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        mins(i,k)=min(min([subjects(i,k).bdyTra(:,1:2) ;subjects(i,k).lTra(:,1:2) ;subjects(i,k).rTra(:,1:2)]));
        maxs(i,k)=max(max([subjects(i,k).bdyTra(:,1:2) ;subjects(i,k).lTra(:,1:2) ;subjects(i,k).rTra(:,1:2)]));
        k=k+1;
        if(rev_index(j,2)~=0)
            load(strcat('.\data\sequences\',int2str(i),'\sequence_',int2str(rev_index(j,2)),'.mat')); %Loads the proper sequence
            subjects(i,k).seqNo=sequenceNumber;
            subjects(i,k).targetNo=j;
            subjects(i,k).subjNo=i;
            subjects(i,k).rTra=bsxfun(@rdivide, sequenceObj.rightFootTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        subjects(i,k).lTra=bsxfun(@rdivide, sequenceObj.leftFootTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        subjects(i,k).bdyTra=bsxfun(@rdivide, sequenceObj.bodyTrajectory, [subjectHeights(i) subjectHeights(i) 1]);
        mins(i,k)=min(min([subjects(i,k).bdyTra(:,1:2) ;subjects(i,k).lTra(:,1:2) ;subjects(i,k).rTra(:,1:2)]));
        maxs(i,k)=max(max([subjects(i,k).bdyTra(:,1:2) ;subjects(i,k).lTra(:,1:2) ;subjects(i,k).rTra(:,1:2)]));
            k=k+1;
        end
        %         catch
        %             fprintf('An error occured at animating subject %d of %dth Subject\n',subjectNo,i);
        %         end
    end
    sub=subjects(i,:);
    eval(sprintf('save(''./dnew/subject%d'',''sub'')',i));
    fprintf('%dth subject: [%.2f %.2f] \n',i,min(mins(i,:)),max(maxs(i,:)));
end
save('./dnew/subjects.mat','subjects')

end
