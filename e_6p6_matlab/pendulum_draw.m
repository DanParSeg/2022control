function f(x)
    clf();
    hold on;
    axis square;
    axis([-10,10,-10,10]*0.15)
    
    x_coor=x(1);
    y_coor=0;
    theta=x(2);

    
    M_plane=[0 0; 0 1; 1 1];
    
    M_rotate=[cos(theta) -sin(theta) 0; 
     sin(theta) cos(theta) 0;
     0 0 1];

    M_translate=[1 0 x_coor;
                0 1 y_coor;
                0 0 1];

    M_plane_transformed=M_translate*M_rotate*M_plane;

    plot(M_plane_transformed(1,:),M_plane_transformed(2,:),'black','LineWidth',1);
end