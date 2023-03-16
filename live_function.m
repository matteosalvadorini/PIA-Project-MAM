function live_function(M,G1,G2)


figure


for ii=1:size(M,1)
    try
        delete(m1m3)
        delete(m2m4)
        delete(m3m4)
        delete(m4m5)
        delete(m1)
        delete(m2)
        delete(m3)
        delete(m4)
        delete(m5)
        delete(g1)
        delete(g2)

    end


    m1m3=line([M(ii,1) M(ii,5)],[M(ii,2) M(ii,6)]);

    set(m1m3,'color','k','linewidth',2)

    m2m4=line([M(ii,3) M(ii,7)],[M(ii,4) M(ii,8)]);
    set(m2m4,'color','k','linewidth',2)

    m3m4=line([M(ii,5) M(ii,7)],[M(ii,6) M(ii,8)]);
    set(m3m4,'color','k','linewidth',2)

    m4m5=line([M(ii,7) M(ii,9)],[M(ii,8) M(ii,10)]);
    set(m4m5,'color','k','linewidth',2)



    m1= plot(M(ii,1),M(ii,2),'o-','MarkerFaceColor','r','MarkerSize',6)
    m2=plot(M(ii,3),M(ii,4),'o-','MarkerFaceColor','r','MarkerSize',6)
    m3=plot(M(ii,5),M(ii,6),'o-','MarkerFaceColor','r','MarkerSize',6)
    m4=plot(M(ii,7),M(ii,8),'o-','MarkerFaceColor','r','MarkerSize',6)
    m5=plot(M(ii,9),M(ii,10),'o-','MarkerFaceColor','r','MarkerSize',6)
    g1=plot(G1(1,ii),G1(2,ii),'o-','MarkerFaceColor','r','MarkerSize',6)
    g2=plot(G2(1,ii),G2(2,ii),'o-','MarkerFaceColor','r','MarkerSize',6)

    hold on
    pause(0.1)


end




end