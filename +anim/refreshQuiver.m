function [ hq ] = refreshQuiver( hq,quiver_vec,ARROW_LENGTH)
%refreshQuiver Refreshes each quiver input.
    ang=quiver_vec(1,3);
    X = quiver_vec(1,1);
    Y = quiver_vec(1,2);
    U = cosd(ang)*ARROW_LENGTH;
    V = sind(ang)*ARROW_LENGTH;
    refreshdata(hq,'caller');
end

