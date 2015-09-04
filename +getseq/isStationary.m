function rslt = isStationary(x,y,isRT)
%isStationary Gicen a stance(x) and a step(y). It calculates the overall
%displacement in x-y and angular coordinate system. If it is below a
%threshold. Then returns 1, otherwise 0;
    DISP_THRES=0.01;
    ANG_THRES=5;
    if isRT
       diff=ftfun.getStepDiff([x(1:4)';y']); 
    else
       diff=ftfun.getStepDiff([x(5:8)';y']);  
    end
    if diff(1)<DISP_THRES&&diff(2)<ANG_THRES
        rslt=1;       
    else
        rslt=0;
    end
end

