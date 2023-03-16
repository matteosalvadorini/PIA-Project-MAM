function [xg,xp] = step_5_3(k,W,r,v_0,x_0,wd,Xip_ph,Xip_abs,t1,h,wn)


beta_v = atan(W*r/k)-pi/2;
phig = atan(-(v_0+Xip_abs*W*sin(Xip_ph+beta_v))/(wd*(x_0-Xip_abs*cos(Xip_ph+beta_v))));
Cg = (x_0-Xip_abs*cos(Xip_ph+beta_v))/cos(phig);


xg = Cg*cos(wd*t1+phig).*exp(-h*wn*t1);
xp = Xip_abs*cos(W*t1+Xip_ph+beta_v);


end