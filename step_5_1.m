function [wn,x0,x1,xd,wd,h,xd_t] = step_5_1(k,handweigth,x_0,v_0,h,t1,r,t)
%% non smorzata
wn=sqrt(k/handweigth);
phi_v=atan(-v_0/(wn*x_0)); %fase
C=x_0/cos(phi_v);
x0=-handweigth*9.810/k;%equilibrio del sistema si ricava con F=ma=0= Fel+mg
x1=C*cos(wn*t1+phi_v);
%% smorzata

h=r/(2*wn*handweigth);
wd=wn*sqrt(1-h^2);
phid=atan(-v_0/wd*x_0); %frequenza sfasamento da rsposta
Cd=x_0/cos(phid);
xd = Cd*cos(wd*t1+phid).*exp(-h*wn*t1);
xd_t = Cd*cos(wd*t+phid).*exp(-h*wn*t);

end