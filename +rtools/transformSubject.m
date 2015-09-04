function [ sub2 ] = transformSubject( sub )
%detectSteps This function gets a sequence array and transforms it to the
%source oriented representation.
sub2=sub;
    for i=1:size(sub,2)     
        sub2(i)=rtools.sequence2SourceRep2(sub(i));
    end
end

