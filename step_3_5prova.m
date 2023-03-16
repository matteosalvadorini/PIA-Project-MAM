function [angle]=step_3_5prova(M)
j=[0 1]; %versore y

for ii=1:size(M)
M2M4(ii,1)=M(ii,7)-M(ii,3);
M2M4(ii,2)=M(ii,8)-M(ii,4);


prodotto_scalare(ii)=j(1)*M2M4(ii,1)+j(2)*M2M4(ii,2);
%%prodotto_scalare =prodotto_moduli * cos
%%modulo di j=1 quindi prodotto_moduli = modulo di M2M4 (*1)
prodotto_moduli(ii)=(sqrt(M2M4(ii,1).^2+(M2M4(ii)).^2));
div(ii)=prodotto_scalare(ii)/prodotto_moduli(ii);



angle(ii)=acos(div(ii));


end

end