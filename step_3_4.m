function [G1_x,G1_y,G2_x,G2_y]=step_3_4(M,lM4M5,lM2M4)
%%G1 -- Proximal Upper arm
for ii=1:size(M,1)
    d_x1(ii)=M(ii,7)-M(ii,3);
    d_y1(ii)=M(ii,8)-M(ii,4); 
    dx1(ii)=d_x1(ii)*0.436;
    dy1(ii)=d_y1(ii)*0.436;
    G1_x (ii)=M(ii,3)+dx1(ii);
    G1_y(ii)=M(ii,4)+dy1(ii);
    



%%G2 -- distal forearm

    d_x(ii)=M(ii,9)-M(ii,7);
    d_y(ii)=M(ii,10)-M(ii,8); 
    dx(ii)=d_x(ii)*0.570;
    dy(ii)=d_y(ii)*0.570;
    G2_x(ii)=M(ii,9)-dx(ii);
    G2_y(ii)=M(ii,10)-dy(ii);
    




end


end