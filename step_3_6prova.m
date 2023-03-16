function [v,a,w,wp,v_x,v_y,a_x,a_y]=step_3_6prova(M,kk,d)
    dt_sa=0.05; %[sec]
    l=size(M,1)-1;

    for ii= 1:l
        v_x(ii)=(M(ii+1,kk)-M(ii,kk))/dt_sa;
        v_y(ii)=(M(ii+1,kk+1)-M(ii,kk+1))/dt_sa;
        
        v_abs(ii)=sqrt((v_x(ii))*(v_x(ii))+(v_y(ii))*(v_y(ii)));

        
        if M(ii+1,kk+1)<M(ii,kk+1)
            v(ii)=-v_abs(ii);
        else
            v(ii)=v_abs(ii);       
        end

        w(ii)=v(ii)/d;

    end
    l_v=length(v)-1;

    for ii= 1:l_v
        
        a_x(ii)=(v_x(ii+1)-v_x(ii))/dt_sa;
        a_y(ii)=(v_y(ii+1)-v_y(ii))/dt_sa;
        a_abs(ii)=sqrt((a_x(ii))*(a_x(ii))+(a_y(ii))*(a_y(ii)));



        if v(ii+1)<v(ii)
            a(ii)=-a_abs(ii);
        else
            a(ii)=a_abs(ii);       
        end

        wp(ii)=a(ii)/d;

    end

end