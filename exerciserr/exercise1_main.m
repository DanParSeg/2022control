init;

x=[-pi/3;2/3*pi;0;0]; % Initial state
u=[0;0]; %control

%model parameters
lz1=1;
lz2=1;
l1=1;
l2=1;
m1=1;
m2=1;
r1=l1/2;
r2=l2/2;

dt=0.01;
frame_counter=0;
t=0;
for t=0:dt:100
    x1=x(1);
    x2=x(2);
    x3=x(3);
    x4=x(4);
    u1=u(1);
    u2=u(2);

    q1=x1;
    q2=x2;
    dq1=x3;
    dq2=x4;

    alpha=lz1+lz2+m1*r1^2+m2*(l1^2+r2^2);
    beta=m2*l1*r2;
    delta=lz2+m2*r2^2;

    B=[alpha+2*beta*cos(q2) delta+beta*cos(q2);
       delta+beta*cos(q2) delta];
    invB=[(4*lz2 + m2)/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2), -(4*lz2 + m2 + 2*l1*m2*cos(q2))/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2); -(4*lz2 + m2 + 2*l1*m2*cos(q2))/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2), (4*m2*l1^2 + 4*m2*cos(q2)*l1 + 4*m1*r1^2 + 4*lz1 + 4*lz2 + m2)/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2)]
    C=[-beta*sin(q2)*dq2 -beta*sin(q2)*(dq1+dq2);
        beta*sin(q2)*dq1 0];

    J=[-l2*sin(q1+q2)-l1*sin(q1) -l2*sin(q1+q2);
        l2*cos(q1+q2)+l1*cos(q1) l2*cos(q1+q2)];
    invJ=[-cos(q1 + q2)/(l1*cos(q1 + q2)*sin(q1) - l1*sin(q1 + q2)*cos(q1)), -sin(q1 + q2)/(l1*cos(q1 + q2)*sin(q1) - l1*sin(q1 + q2)*cos(q1)); (l2*cos(q1 + q2) + l1*cos(q1))/(l1*l2*cos(q1 + q2)*sin(q1) - l1*l2*sin(q1 + q2)*cos(q1)), (l2*sin(q1 + q2) + l1*sin(q1))/(l1*l2*cos(q1 + q2)*sin(q1) - l1*l2*sin(q1 + q2)*cos(q1))];
    dJ=[-l1*cos(x1)*x3-l2*cos(x1+x2)*(x3+x4) -l2*cos(x1+x2)*(x3+x4);
        -l1*sin(x1)*x3-l2*sin(x1+x2)*(x3+x4) -l2*sin(x1+x2)*(x3+x4)];

    %posicion deseada
    c=[1;1];
    r=0.5;
    pd=c+r*[cos(t);sin(t)];
    dpd=r*[-sin(t);cos(t)];
    ddpd=r*[-cos(t);-sin(t)];
    %posicion actual
    p=[l2*cos(q1+q2)+l1*cos(q1);
       l2*sin(q1+q2)+l1*sin(q1)];

    Kd=[1 0;0 1]*10;
    Kp=[1 0;0 1]*50;

    v=invJ*(ddpd+Kd*(dpd-J*[x3;x4])+Kp*(pd-p)-dJ*[x3;x4]);
    u=B*v-B*(-invB*C*[x3;x4]);
    

    x=x+f(x,u)*dt;
    pause(dt);
    frame_counter =frame_counter+1;
    % Frame sampling
    if frame_counter == 10
       draw(t,x,pd);
       pause(0.00000001);
       frame_counter =0;
    end
end;

