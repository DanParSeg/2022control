function draw()
  draw_simulation()
  %draw_simulation(x,w)
  %draw_plot(t,x,u)
  %draw_profesor(x)
  
end

function draw_plot(t,x,u)
    axis([0,10,-1,1]*2)
    plot(t,x(1),'k--.',t,x(2),'r--.')
end

function draw_simulation(x,w)
    clf();
    hold on;
    axis square;
    axis([-1,1,-1,1]*1.2)

    q1=3.14;%angular position
    q2=0.3;%linear position
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

    p=[l2*cos(q1) - cos(q1)*(d2 - q2);
       l2*sin(q1) - sin(q1)*(d2 - q2)]%tip position

    %p = nsidedpoly(1000, 'Center', c, 'Radius', r);
    %plot(p, 'FaceColor', 'w')
    %plot(w(1),w(2),'+ red')
    plot(0,0,'o red')
    plot(arm_transformed(1,:),arm_transformed(2,:),'black','LineWidth',1);
end