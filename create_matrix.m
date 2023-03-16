function M=create_matrix(cinque,M2)
    v1_x=cinque(:,1);
    v1_y=cinque(:,2);
    v2_x=M2(:,1);
    v2_y=M2(:,2);
    v3_x=cinque(:,3);
    v3_y=cinque(:,4);
    v4_x=cinque(:,5);
    v4_y=cinque(:,6);
    v5_x=cinque(:,7);
    v5_y=cinque(:,8);

    M = [v1_x v1_y v2_x v2_y v3_x v3_y v4_x v4_y v5_x v5_y];

end