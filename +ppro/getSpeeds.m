function [ sdr,sdl] = getSpeeds( seq )
%getSpeeds Creates the penaltized speed sequences of a given sequence
%   Detailed explanation goes here
SMOOTHING_FACTOR=5;
lf=ppro.fixAngle(seq.lTra);
rf=ppro.fixAngle(seq.rTra);
dl=diff(lf);
dl(:,3)=dl(:,3)./500;
dr=diff(rf);
dr(:,3)=dr(:,3)./500;
temp_sdr=ppro.movingAvr(sum(abs(dr),2),SMOOTHING_FACTOR);
temp_sdl=ppro.movingAvr(sum(abs(dl),2),SMOOTHING_FACTOR);
sdr=temp_sdr-temp_sdl./2; %It is unlikely that two foot move at the same time, so I penaltize them.
sdl=temp_sdl-temp_sdr./2;
end

