function [xip_abs,xip_ph,Xip_abs,Xip_ph,xip] = step_5_2(k,handweigth,w,W,r,A)

wr=w*r;
w2=w.^2;

xip=(A*(wr+k).*(k-(w2)*handweigth - wr*1i))./((k-(w2).*handweigth).^2+(wr).^2);


Wr=W*r;
W2=W^2;

Xip=(A*(Wr+k)*(k-(W2)*handweigth - Wr*1i))/((k-(W2)*handweigth)^2+(Wr)^2);



xip_abs=abs(xip);
xip_ph=angle(xip);

Xip_abs=abs(Xip);
Xip_ph=angle(Xip);

end