function controller_fl_init_draw(x,pd)
    clf();
    hold on;
    axis square;
    axis([-0.75,0.75,-0.75,0.75]*1.2)

    q1=x(1);%angular position
    q2=x(2);%linear position
    l2=1;%length of the arm
    d2=l2/2;
    
    arm=   [0 l2;
             0 0;
             1 1];

    M_rotate_arm=[cos(q1) -sin(q1) 0; 
              sin(q1) cos(q1) 0;
              0 0 1];

    M_translate_arm=[1 0 q2-d2; 0 1 0; 0 0 1];


    arm_transformed=M_rotate_arm*M_translate_arm*arm;
    
    %r=0.25;
    %c=[0.5,0.5];
    %p = nsidedpoly(1000, 'Center', c, 'Radius', r);
    %plot(p, 'FaceColor', 'w')
    plot(pd(1),pd(2),'+ red')
    plot(0,0,'o red')
    plot(arm_transformed(1,:),arm_transformed(2,:),'black','LineWidth',1);
    pause(0.000000000000000000001);%update plot
end