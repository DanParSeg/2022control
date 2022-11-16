function f(x)
    clf();
    hold on;
    axis square;
    axis([-10,10,-10,10]*1)
    
    x_coor=x(1);
    y_coor=x(2);
    theta=x(3);

    
    M_plane=[ 5.5 3   2 3   2 1   0 -1 0   1 0   -1 -2  -3 -2   -3 -5.5 -3 -2   -2 -2  0    0  0  2    2  2 3;
                0 0 0.5 3 0.5 1 1.2  1 0.7 1 0.7  1 0.5 3  0.5  0    0  0 -1 -2.4 -1 -1 -2.4 -1 -1 -2.4 -1 0;
            ones(1,28)];
    
    M_rotate=[cos(theta) -sin(theta) 0; 
     sin(theta) cos(theta) 0;
     0 0 1];

    M_translate=[1 0 x_coor;
                0 1 y_coor;
                0 0 1];

    M_plane_transformed=M_translate*M_rotate*M_plane;

    plot(M_plane_transformed(1,:),M_plane_transformed(2,:),'black','LineWidth',1);  
end