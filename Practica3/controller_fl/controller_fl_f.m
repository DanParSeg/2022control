function  dx = controller_fl_f(x,u)
    q1=x(1);
    q2=x(2);
    dq1=x(3);
    dq2=x(4);
    u1=u(1);
    u2=u(2);
    
    m2=1;
    g=9.81;
    I1=1;
    I2=2;
    l2=1;
    d2=0.5;


    dx=[dq1;
        dq2;
        -(2*dq1*dq2*m2*q2 - u1 + g*m2*q2*cos(q1))/(m2*q2^2 + I1 + I2);
        (m2*q2*dq1^2 + u2 - g*m2*sin(q1))/m2];
end