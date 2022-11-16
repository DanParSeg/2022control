function f(x)
    close all;
    clf();
    hold on;
    axis square;
    axis([-10,10,-10,10])
    
    d=5.5;
    theta=x(1);
    x_coor=x(2);
    y_coor=x(3);
    
    M_plane=[-d d;
            0 0;
            1 1];
    
    M_rotate=[cos(theta) -sin(theta) 0; 
     sin(theta) cos(theta) 0;
     0 0 1];

    M_translate=[1 0 x_coor;
                0 1 y_coor;
                0 0 1];

    M_plane_transformed=M_translate*M_rotate*M_plane;

    plot(M_plane_transformed(1,:),M_plane_transformed(2,:),'black','LineWidth',1);  
end
