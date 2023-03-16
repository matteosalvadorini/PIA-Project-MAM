function [betap,gammap]=step_3_7_chiusura(M,alphap,lM2M4,lM3M4,lM1M4)
a=lM2M4;
b=lM3M4;
c=lM1M4;


%Calcolo delle fasi dei vettori della chiusura cinematica
for ii=1:length(alphap)
    %alpha
    if M(ii,8)<M(ii,4)
        alpha(ii,1)=360-atand((abs(M(ii,8)-M(ii,4)))/(abs(M(ii,7)-M(ii,3))));
    elseif M(ii,8)>M(ii,4)
        alpha(ii,1)=atand((abs(M(ii,8)-M(ii,4)))/(abs(M(ii,7)-M(ii,3))));
    elseif M(ii,8)==M(ii,4)
        alpha(ii,1)=0;
    end
    %gamma
    if M(ii,6)<M(ii,2)
        gamma(ii,1)=360-atand((abs(M(ii,6)-M(ii,2)))/(abs(M(ii,5)-M(ii,1))));
    elseif M(ii,6)>M(ii,2)
        gamma(ii,1)=atand((abs(M(ii,6)-M(ii,2)))/(abs(M(ii,5)-M(ii,1))));
    elseif M(ii,6)==M(ii,2)
        gamma(ii,1)=0;
    end
    %beta
    beta(ii,1)=atand((abs(M(ii,6)-M(ii,8)))/(abs(M(ii,5)-M(ii,7))));






x0=[a*alphap(ii)*sind(alpha(ii));
        -a*alphap(ii)*cosd(alpha(ii))];
    A=[c*sind(gamma(ii)) -b*sind(beta(ii));
        -c*cosd(gamma(ii)) b*cosd(beta(ii))];
    x=inv(A)*x0;
    gammap(ii,1)=x(1);
    betap(ii,1)=x(2);

end
%AA= [-b*cos(beta(ii,1)) c*cos(gamma(ii,1));
 %    b*sin(beta(ii,1)) -c*sin(gamma(ii,1))];

%CC=[w_4(ii)*a*cos(alpha(ii,1));
 %   -w_4(ii)*a*sin(alpha(ii,1))];
%xp=inv(AA)*CC;
%bp(ii)=xp(1);
%gammap(ii)=xp(2);
end