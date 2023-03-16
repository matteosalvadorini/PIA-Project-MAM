function M2 = step_3_1(cinque)
    for ii=1:length(cinque) 
        M2(ii,1)=cinque(ii,1);
        M2(ii,2)=cinque(ii,2)-24;
    end
end