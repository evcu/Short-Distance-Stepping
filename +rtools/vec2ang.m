function [ out ] = vec2ang( quad )
%vec2ang This function transforms the unit direction vector into the angle.
%Input n*4 Output n*3
    x=quad(:,3);
    y=quad(:,4);
    gama=atand(y./x);
    gama(x<0&y>=0)=180+gama(x<0&y>=0); 
    gama(x<0&y<0)=gama(x<0&y<0)-180; 
    out=[quad(:,1:2) gama];
end