function xx1=step_4_4(upperarmweight,forearmweight,handweigth,a0_G1,a0_G2,JG1,JG2,phi,beta0,w0_4,wp0_4,lM2G1,lM4G2,lM4G1,lM1M3,lM3M4,lM2M4,lM4M5)
%[H1 V1 H2 V2 H3 V3 H4 V4 Cf Ce] matrice coefficienti
%H43 e V43 sono associati a cerniera in m4 dovuti da asta m3m4      
g=9.81;
a0_G1=a0_G1/1000;
a0_G2=a0_G2/1000;

if w0_4<0

    AA=[0 1 0 0 0 1 0 0 0 0;
        1 0 0 0 -1 0 0 0 0 0;
        0 0 0 0 0 lM1M3/1000 0 0 0 0;
        0 0 0 0 0 -1 0 1 0 0;
        0 0 0 0 1 0 1 0 0 0;
        0 0 0 0 -lM3M4/1000*sin(beta0) -lM3M4/1000*cos(beta0) 0 0 0 0;
        0 0 0 1 0 0 0 -1 0 0;
        0 0 1 0 0 0 -1 0 0 0;
        0 0 0 lM2M4/1000 0 0 0 0 -1 1;
        0 0 0 0 0 0 0 0 -1 0.1];
else
     AA=[0 1 0 0 0 1 0 0 0 0;
        1 0 0 0 -1 0 0 0 0 0;
        0 0 0 0 0 lM1M3/1000 0 0 0 0;
        0 0 0 0 0 -1 0 1 0 0;
        0 0 0 0 1 0 1 0 0 0;
        0 0 0 0 -lM3M4/1000*sin(beta0) -lM3M4/1000*cos(beta0) 0 0 0 0;
        0 0 0 1 0 0 0 -1 0 0;
        0 0 1 0 0 0 -1 0 0 0;
        0 0 0 lM2M4/1000 0 0 0 0 -1 1;
        0 0 0 0 0 0 0 0 -0.1 1];

end
%%[]matrice termini noti
xx0=[0;
    0;
    0;
    0;
    0;
    0;
    (forearmweight + upperarmweight + handweigth)*g + upperarmweight*a0_G1(3)/1000 + forearmweight*a0_G2(3)/1000;
    upperarmweight*a0_G1(2)/1000 + forearmweight * a0_G2(2)/1000;
    upperarmweight*lM4G1/1000*(g + a0_G1(3)/1000)-handweigth*g*(lM4M5/1000)*cos(phi) + forearmweight*lM4G2/1000*sin(phi)*a0_G2(2) - forearmweight*lM4G2/1000*cos(phi)*( g + a0_G2(3)/1000) - wp0_4*(JG1+JG2);
    0];

xx1=inv(AA)*xx0;
H1=xx1(1);
V1=xx1(2);
H2=xx1(3);
V2=xx1(4);
H3=xx1(5);
V3=xx1(6);
H4=xx1(7);
V4=xx1(8);
Cf=xx1(9);
Ce=xx1(10);

end