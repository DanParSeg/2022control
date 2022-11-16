
function  xdot  = f(x,u)
    d=5.5;
    J=10000;
    m=30000;
    g=9.81;
    
    B=[0 0;
       0 0;
       0 0;
       -sin(x(3))/m 0;
       cos(x(3))/m 0;
       0 2*d/J;
    ];
    
    xdot=[x(4);x(5);x(6);0;-g;0]+B*u;
end

