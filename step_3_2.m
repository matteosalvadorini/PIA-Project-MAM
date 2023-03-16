%calcolo la media tra tutte i valori associati ad x ed y dei vari punti in
%quanto vi potrebbe essere un errore durante la misurazione, quindi
%prendere solo un punto potrebbe essere impreciso... Si fa prima quindi la
%media di tutti i  valori delle colonne e poi si calcola la distanza con la
%media

function [x_length,y_length,l]=step_3_2(M,kk,rr) %funzione a quale passare rr ed kk ovvero le colonne che presentano i punti di cui trovare la distanza 
columns_mean=mean(M);

              %in particolare kk_x relativa a x e kk_y relativa a y del punto considerato, analogo per rr
        x_length=columns_mean(kk)-columns_mean(rr);
        y_length=columns_mean(kk+1)-columns_mean(rr+1);
    
    l=sqrt(x_length^2 + y_length^2);
end