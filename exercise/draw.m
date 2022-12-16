% Adapted from https://www.ensta-bretagne.fr/jaulin/


function draw(t,x,u,w)
  draw_simulation(x,w)
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
    axis([-0,2,-0.5,1.5]*1)

    l1=1
    l2=1
    c=[1 1]
    r=1/2
    
    q1=x(1);
    q2=x(2);
    arm2x=l1;
    arm2y=0;
    
    arm1=   [0 l1;
             0 0;
             1 1];
    arm2=   [0 l2;
             0 0;
             1 1];

    M_rotate_arm1=[cos(q1) -sin(q1) 0; 
              sin(q1) cos(q1) 0;
              0 0 1];
    M_rotate_arm2=[cos(q2) -sin(q2) 0; 
              sin(q2) cos(q2) 0;
              0 0 1];
    M_translate_arm2=[1 0 arm2x; 0 1 arm2y; 0 0 1];


    arm1_transformed=M_rotate_arm1*arm1;
    arm2_transformed=M_rotate_arm1*M_translate_arm2*M_rotate_arm2*arm2;

    p = nsidedpoly(1000, 'Center', c, 'Radius', r);
    plot(w(1),w(2),'+ red')
    plot(p, 'FaceColor', 'w')
    plot(arm1_transformed(1,:),arm1_transformed(2,:),'black','LineWidth',1);
    plot(arm2_transformed(1,:),arm2_transformed(2,:),'red','LineWidth',1);
end

function draw_profesor(x)
    l1=1;
    l2=1;
    
    r = 0.5;
    
    xelbow = l1*cos(x(1,:));
    yelbow = l1*sin(x(1,:));
    
    xtip = xelbow + l2*cos(x(1,:) + x(2,:));
    ytip = yelbow + l2*sin(x(1,:) + x(2,:));
    
    axis([-1 2 -1 2])
    hold on;
    
    axis square
        
    plot([0,xelbow], [0,yelbow],'r','LineWidth',0.1)
    plot([xelbow,xtip], [yelbow,ytip],'r','LineWidth',0.1)
    
    
    drawnow;
end
