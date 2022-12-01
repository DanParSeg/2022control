% Adapted from https://www.ensta-bretagne.fr/jaulin/


function draw(t,x,u)
  draw_pendulum(x)
  %draw_plot(t,x,u)
  
end

function draw_plot(t,x,u)
    axis([0,10,-1,1]*2)
    plot(t,x(1),'k--.',t,sin(t),'r--.',t,u,'g--.')
end

function draw_pendulum(x)
    clf();
    hold on;
    axis square;
    axis([-1,1,-1,1]*1.5)
    
    q1=x(1);
    
    Pendulo=[0 0;
             0 -1;
             1 1];

    M_rotate_pendulo=[cos(q1) -sin(q1) 0; 
              sin(q1) cos(q1) 0;
              0 0 1];

    Pendulo_transformed=M_rotate_pendulo*Pendulo;

    plot(Pendulo_transformed(1,:),Pendulo_transformed(2,:),'black','LineWidth',1);
end
