function [ subSeq ] = getSubSequence( seq,interval )
%getSubSequence Gets a sequence struct and returns another sequence struct
%with the sequence in the given interval.
%TODO improve it for one step cuting. Include Source Target Step fields in
%sequence. So create a new struct.
    subSeq=seq;
    subSeq.rTra=seq.rTra(interval,:);
    subSeq.lTra=seq.lTra(interval,:);
    subSeq.bdyTra=seq.bdyTra(interval,:);
end

