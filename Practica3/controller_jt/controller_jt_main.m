controller_jt_init;

x=[0;0.2;0;0];%initial state
u=[0;0];%initial control

%parameters
m2=1;
g=9.81;
I1=1;
I2=2;
l2=1;
d2=0.5;

dt=0.05;
frame_counter=0;
for t=0:dt:50
    q1=x(1);
    q2=x(2);
    dq1=x(3);
    dq2=x(4);
    u1=u(1);
    u2=u(2);

    Kp=[50 0; 0 150]*1;
    Kd=[10 0; 0 10]*1;
    p=[l2*cos(q1) - cos(q1)*(d2 - q2);
       l2*sin(q1) - sin(q1)*(d2 - q2)]%tip position
    r=0.25;
    c=[0.5;0.5];
    w=0.25;
    pd=c+r*[cos(w*t);sin(w*t)];%desired position
    J=[sin(q1)*(d2 - q2) - l2*sin(q1), cos(q1);
       l2*cos(q1) - cos(q1)*(d2 - q2), sin(q1)];
    u=transpose(J)*Kp*(pd-p)-Kd*[dq1;dq2];

    x=x+controller_jt_f(x,u)*dt; % Euler x
    % Frame sampling
    if frame_counter == 0
       controller_jt_draw(x,pd);
       pause(0.000000000000000000001);
    end
    t
    frame_counter =frame_counter+1;
    if frame_counter == 1
        frame_counter=0;
    end
end;