function [closestIndex,v0_G1RIVALS]=step_4_dati(M,w0_4,lM2G1,wp0_4)
M4=M(:,8);
M2=M(:,4);
[minValue,closestIndex] = min(abs(M4-M2));
closestValue = M4(closestIndex) ;




v0_G1RIVALS=w0_4*lM2G1;


a0_G1RIVALS=wp0_4*lM2G1-lM2G1*w0_4^2;



end