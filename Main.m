clear
close all
clc
load('data_stud.mat')
%% step_3_1
M2 =step_3_1(cinque);


%% Creation of Matrix M of M1|M2|M3|M4|M5 with x|y componenent respectively

M=create_matrix(cinque,M2);

%% step_3_2

kk=1;
rr=3;
[x_M2M1,y_M2M1,lM1M2]=step_3_2(M,kk,rr);
M1M2=[x_M2M1,y_M2M1,lM1M2];

kk=1;
rr=5;
[x_M1M3,y_M1M3,lM1M3]=step_3_2(M,kk,rr);
M1M3=[x_M1M3,y_M1M3,lM1M3];

kk=3;
rr=7;
[x_M2M4,y_M2M4,lM2M4]=step_3_2(M,kk,rr);
M2M4=[x_M2M4,y_M2M4,lM2M4];

kk=5;
rr=7;
[x_M3M4,y_M3M4,lM3M4]=step_3_2(M,kk,rr);
M3M4=[x_M3M4,y_M3M4,lM3M4];

kk=3;
rr=9;
[x_M2M5,y_M2M5,lM2M5]=step_3_2(M,kk,rr);
M2M5=[x_M2M5,y_M2M5,lM2M5];


kk=1;
rr=7;
[x_M1M4,y_M1M4,lM1M4]=step_3_2(M,kk,rr);
M1M4=[x_M1M4,y_M1M4,lM1M4];


kk=7;
rr=9;
[x_M4M5,y_M4M5,lM4M5]=step_3_2(M,kk,rr);
M4M5=[x_M4M5,y_M4M5,lM4M5];



%% step_3_4

[G1_x,G1_y,G2_x,G2_y]=step_3_4(M,lM4M5,lM2M4);
G1=[G1_x;G1_y];
G2=[G2_x;G2_y];

figure

subplot(211)
plot(G1_x,G1_y)
title('G1')
grid on

subplot(212)
plot(G2_x,G2_y)
title('G2')
grid on




%% step_3_3

figure 

subplot(321)
step_3_3(M,1,2)
title('M1')
grid on

subplot(322)
step_3_3(M,3,4)
title('M2')
grid on

subplot(323)
step_3_3(M,5,6)
title('M3')
grid on

subplot(324)
step_3_3(M,7,8)
title('M4')
grid on

subplot(325)
step_3_3(M,9,10)
title('M5')
grid on

%subplot(326)

figure
hold on
grid on
step_3_3(M,1,2)
step_3_3(M,3,4)
step_3_3(M,5,6)
step_3_3(M,7,8)
step_3_3(M,9,10)
plot(G1_x,G1_y)
plot(G2_x,G2_y)


legend('M1','M2','M3','M4','M5','G1','G2')




%% step_3_5

dt=0.05;
time = [0:dt:(size(M,1)-1)*dt];

[angleprova]=step_3_5prova(M);
ANGLEprova=rad2deg(angleprova);

figure

plot(time,ANGLEprova)
title('Range of Motion')
ylabel('ϑ [rad]')
xlabel('t [s]')
grid on

%% step_3_6

kk=7; 
[v_4,a_4,w_4,wp_4,v_4x,v_4y,a_4x,a_4y]=step_3_6prova(M,kk,lM2M4);
dt=0.05;
time_v = [0:dt:(size(M,1)-2)*dt];
time_a = [0:dt:(size(M,1)-3)*dt];




figure

subplot(211) 
plot(time_v,v_4)
title('Velocity of M4')
ylabel('v [mm/s]')
xlabel('t [s]')
grid on

subplot(212)
plot(time_a,a_4)
title('Acceleration of M4')
ylabel('a [mm/s^2]')
xlabel('t [s]')
grid on


%% step_3_7



for ii=1:length(w_4)
    v_5(ii)=w_4(ii)*lM2M5;   
end

for ii=1:length(wp_4) 
    a_5(ii)=wp_4(ii)*lM2M5-w_4(ii)*w_4(ii)*lM2M5;
end



kk=9; 
[v_5_real,a_5_real,w_5_real,wp_5_real,v_5x,v_5y,a_5x,a_5y]=step_3_6prova(M,kk,lM2M5);


figure

grid on
hold on
plot(time_v,w_4 )
plot(time_v,w_5_real)
title('Angular Velocity of M5')
ylabel('v [rad/s]')
xlabel('t [s]')
legend('Theoretical','Experimental')

 

figure
grid on
hold on
plot(time_a,a_5 )
plot(time_a,a_5_real)
title('Acceleration of M5')
ylabel('v [mm/s^2]')
xlabel('t [s]')
legend('Theoretical','Experimental')



[bpc,gammapc]=step_3_7_chiusura(M,w_4,lM2M4,lM3M4,lM1M4);


figure

subplot(211)
plot(time_v,bpc)
title('Velocity of M3')
ylabel('v [mm/s]')
xlabel('t [s]')
grid on


subplot(212)
plot(time_v,gammapc)
title('Angular Velocity of m3')
ylabel('w [rad/s]')
xlabel('t [s]')
grid on



%% step 4 dati

m=67;%[Kg]
upperarmweight=0.028*m;
forearmweight=0.016*m;
handweigth=0.006*m;
radius_of_giration_G1=0.322*lM2M4;
radius_of_giration_G2=0.303*lM4M5;
JG1=upperarmweight*radius_of_giration_G1^2/1000000;
JG2=forearmweight*radius_of_giration_G2^2/1000000;

tmp=[180 0];


for ii=1:length(ANGLEprova)
    if abs(90-ANGLEprova(ii))<abs(90-tmp(1)) && w_4(ii)>0
        tmp=[ANGLEprova(ii) ii];
    end
end

v0_4=v_4(tmp(2));
v0_4x=v_4x(tmp(2));
v0_4y=v_4y(tmp(2));
a0_4=a_4(tmp(2));
a0_4x=a_4x(tmp(2));
a0_4y=a_4y(tmp(2));
w0_4=w_4(tmp(2));
wp0_4=wp_4(tmp(2));



%% step_4_1

[v_G1,a_G1,v_G1x,v_G1y,a_G1x,a_G1y]=step_4_data_velocity_G(G1);

v0_G1=[v_G1(tmp(2)) v_G1x(tmp(2)) v_G1y(tmp(2))];
a0_G1=[a_G1(tmp(2)) a_G1x(tmp(2)) a_G1y(tmp(2))];


lM2G1=lM2M4*0.436;
v0_G1RIVALS=w0_4*lM2G1;
a0_G1RIVALS=wp0_4*lM2G1-lM2G1*w0_4^2;

%%
[v_G2,a_G2,v_G2x,v_G2y,a_G2x,a_G2y]=step_4_data_velocity_G(G2);

h=[M(:,9) M(:,10)];

H=h.';

[v_h,a_h,v_hx,v_hy,a_hx,a_hy]=step_4_data_velocity_G(H);


v0_G2=[v_G2(tmp(2)) v_G2x(tmp(2)) v_G2y(tmp(2))];
a0_G2=[a_G2(tmp(2)) a_G2x(tmp(2)) a_G2y(tmp(2))];


v0_h=[v_h(tmp(2)) v_hx(tmp(2)) v_hy(tmp(2))];
a0_h=[a_h(tmp(2)) a_hx(tmp(2)) a_hy(tmp(2))];


%%velocity M2
kk=1;
d=lM1M2;
[v2,a2,w2,wp2,v_x2,v_y2,a_x2,a_y2]=step_3_6prova(M,kk,d);


lM2G2=sqrt((G2_x(tmp(2))-M(tmp(2),3))*(G2_x(tmp(2))-M(tmp(2),3))+(G2_y(tmp(2))-M(tmp(2),4))*(G2_y(tmp(2))-M(tmp(2),4)));
v0_G2RIVALS=v2(tmp(2))+w0_4*lM2G1;
a0_G2RIVALS=a2(tmp(2))+wp0_4*lM2G2-lM2G2*w0_4^2;


lM5G2=lM4M5*0.570;
lM4G1=lM2M4-lM2G1;
lM4G2=lM4M5-lM5G2;

phiprova=atan((M(tmp(2),10)-M(tmp(2),8))/(M(tmp(2),9)-M(tmp(2),7)));
phi=abs(phiprova);%%angolo inclinazione m4 m5 
%notare valore asoluto in quanto tangente funxione dispari quindi if fosse
%negativo  valore negativo



%% vettori

figure
quiver(G1(1,tmp(2)),G1(2,tmp(2)),v0_G1(2),v0_G1(3),0);
hold on
quiver(G2(1,tmp(2)),G2(2,tmp(2)),v0_G2(2),v0_G2(3),0);
grid on
title('Vector of Velocity of G1,G2')
legend('G1','G2')

figure
quiver(G1(1,tmp(2)),G1(2,tmp(2)),a0_G1(2),a0_G1(3),0);
hold on
quiver(G2(1,tmp(2)),G2(2,tmp(2)),a0_G2(2),a0_G2(3),0);
grid on
title('Vector of Acceleration of G1,G2')
legend('G1','G2')

%% 



%xx=step_4_3(lM4G1,upperarmweight,forearmweight,a0_G1,a0_G2,JG1,JG2,phi,wp0_4,lM2G1,lM4G2)
%xx1=step_4_4(lM4G1,upperarmweight,forearmweight,handwwight,a0_G1,a0_G2,JG1,JG2,phi,wp0_4,lM2G1,lM4G2,lM4M5)


alpha0=atan(abs(M(tmp(2),2)-M(tmp(2),6))/abs(M(tmp(2),1)-M(tmp(2),5))); 
%si nota che alpha0 angolo di inclinazione braccio m1 m3 è circa 0 quindi
%approssimabile a orizzontale , analogamente a braccio m2 m4


beta0=atan(abs(M(tmp(2),8)-M(tmp(2),6))/abs(M(tmp(2),7)-M(tmp(2),5)));


%v0_h_tot=w0_4*lM2M5;
%a0_h_tot=wp0_4*lM2M5-lM2M5*w0_4^2;

%v0_hrivals=[v0_h_tot,v0_h_tot*cos(beta0), v0_h_tot*sin(beta0)];
%a0_hrivals=[a0_h_tot,a0_h_tot*cos(beta0), a0_h_tot*sin(beta0)];

xx=step_4_3(upperarmweight,forearmweight,handweigth,a0_G1,a0_G2,JG1,JG2,phi,beta0,wp0_4,w0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);
xx1=step_4_4(upperarmweight,forearmweight,handweigth,a0_G1,a0_G2,JG1,JG2,phi,beta0,w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);


%xxb = step_4_3_bilanciopotenze(upperarmweight,forearmweight,handweigth,v0_G1,v0_G2,v0_h,a0_h,a0_G1,a0_G2,JG1,JG2,phi,beta0, w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);
%xxbg = step_4_4_bilanciopotenze(upperarmweight,forearmweight,handweigth,v0_G1,v0_G2,v0_h,a0_h,a0_G1,a0_G2,JG1,JG2,phi,beta0, w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);

%closestIndex=step_4_dati(M)
disp('step 4.3')
disp('Cf=');
disp(xx(9));
disp('Ce=');
disp(xx(10));

disp('step 4.4')
disp('Cf=');
disp(xx1(9));
disp('Ce=');
disp(xx1(10));




%% step_4_5

xx_4_5=step_4_5(upperarmweight,forearmweight,handweigth,a0_G1,a0_G2,JG1,JG2,phi,beta0,w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);

disp('step 4.5')
disp('M1');
disp(xx_4_5(1));
disp(xx_4_5(2));
disp('M2');
disp(xx_4_5(3));
disp(xx_4_5(4));


%% step_4_6

xx_4_6=step_4_6(handweigth,radius_of_giration_G1,radius_of_giration_G2,a0_G1,a0_G2,phi,beta0,w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5);

disp('step 4.6')
disp('M1');
disp(xx_4_6(1));
disp(xx_4_6(2));
disp('M2');
disp(xx_4_6(3));
disp(xx_4_6(4));




%% Dati vibrazioni
P=7;
r=500; %[Ns/m]
k=1e7/(P+1); %[N/m]
A=0.005; %[m]
W=P*1000; %[rad/s]
x_0=0.1;
v_0=0; %velocità iniziale
t=[0:0.001:40];
t1=[0:0.0001:0.05];


%% STEP5.1 (frequenza propria, smorzamento adimensionale e risposta libera)


[wn,x0,x1,xd,wd,h,xd_t] = step_5_1(k,handweigth,x_0,v_0,h,t1,r,t);

figure
hold on
plot(t1,x1+x0)
plot([0 t1(end)],[x0 x0],'k--') %k-- : k=black e -- tratteggiata
ylabel('w [rad/s]')
xlabel('t [s]')
title('Not Damped Free Response')
grid on


figure
hold on
plot(t1,xd+x0)
plot([0 t1(end)],[x0 x0],'k--')
title('Damped Free Response')
ylabel('w [rad/s]')
xlabel('t [s]')
grid on


%% STEP5.2 (risposta forzata)

w=[0:0.01:10000];

[xip_abs,xip_ph,Xip_abs,Xip_ph,xip] = step_5_2(k,handweigth,w,W,r,A);


figure
subplot(211)
hold on
plot(w,xip_abs)
plot(W,Xip_abs,'r*')
title('Magnitude Forced Response')
ylabel('|H(W)| [mm]')
xlabel('w [rad]')
grid on

subplot(212)
hold on
plot(w,xip_ph)
plot(W,Xip_ph,'r*')
title('Phase Forced Response')
ylabel('ph [rad]')
xlabel('w [rad]')
grid on


%% normalizzata

[xip_abs,xip_ph,Xip_abs,Xip_ph,xip] = step_5_2(k,handweigth,w,W,r,A);


figure
subplot(211)
hold on
plot(w/k,xip_abs/k)
plot(W/k,Xip_abs/k,'r*')
title('Magnitude Forced Response')
ylabel('|H(W)| [mm]')
xlabel('W/w [rad]')
grid on

subplot(212)
hold on
plot(w/k,xip_ph/k)
plot(W/k,Xip_ph/k,'r*')
title('Phase Forced Response')
ylabel('ph [rad]')
xlabel('W/w [rad]')
grid on


%% risposta completa

[xg,xp] = step_5_3(k,W,r,v_0,x_0,wd,Xip_ph,Xip_abs,t1,h,wn);

figure
plot(t1,xg+xp+x0)
title('Total Response')
ylabel('x(t) [mm]')
xlabel('t [s]')
grid on

%% implementazioni

P=1.3;
r=100; %[Ns/m]
k=1e6; %[N/m]
A=0.005; %[m]
W=P*1000; %[rad/s]
x_0=0.1;
v_0=0; %velocità iniziale
t=[0:0.001:40];
t1=[0:0.001:0.5];



[wn,x0,x1,xd,wd,h,xd_t] = step_5_1(k,handweigth,x_0,v_0,h,t1,r,t);



figure
hold on
plot(t1,xd+x0)
plot([0 t1(end)],[x0 x0],'k--')
title('Damped Free Response')
ylabel('w [rad/s]')
xlabel('t [s]')
grid on


%%STEP5.2 (risposta forzata)

w=[0:0.01:10000];

[xip_abs,xip_ph,Xip_abs,Xip_ph,xip] = step_5_2(k,handweigth,w,W,r,A);


figure
subplot(211)
hold on
plot(w,xip_abs)
plot(W,Xip_abs,'r*')
title('Magnitude Forced Response')
ylabel('|x| [mm]')
xlabel('w [rad]')
grid on

subplot(212)
hold on
plot(w,xip_ph)
plot(W,Xip_ph,'r*')
title('Phase Forced Response')
ylabel('teta [rad]')
xlabel('w [rad]')
grid on





%%risposta completa

[xg,xp] = step_5_3(k,W,r,v_0,x_0,wd,Xip_ph,Xip_abs,t1,h,wn);

figure
plot(t1,xg+xp+x0)
title('Total Response')
ylabel('x(t) [mm]')
xlabel('t [s]')
grid on


%% live
%live_function(M,G1,G2)

