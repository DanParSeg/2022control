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

    Kp=[20 0; 0 100]*1;
    Kd=[20 0; 0 20]*1;
    p=[l2*cos(q1) - cos(q1)*(d2 - q2);
       l2*sin(q1) - sin(q1)*(d2 - q2)]%tip position
    
    w=0.1;
    func=rem(int32(w*t),2);
    if func==0
        pd=[0.5;0.25];
    else
        pd=[-0.5;0.75];%desired position
    end
    dpd=[0;0];
    ddpd=[0;0];

    J=[sin(q1)*(d2 - q2) - l2*sin(q1), cos(q1);
       l2*cos(q1) - cos(q1)*(d2 - q2), sin(q1)];
    dJ=[cos(q1)*(d2-q2)*dq1-sin(q1)*dq2-l2*cos(q1)*dq1 -sin(q1)*dq1;
        cos(q1)*dq2+sin(q1)*(d2-q2)*dq1-l2*sin(q1)*dq1 cos(q1)*dq1];
    invJ=[-sin(q1)/(l2*cos(q1)^2-d2*cos(q1)^2-d2*sin(q1)^2+l2*sin(q1)^2+cos(q1)^2*q2+sin(q1)^2*q2) cos(q1)/(l2*cos(q1)^2-d2*cos(q1)^2-d2*sin(q1)^2+l2*sin(q1)^2+cos(q1)^2*q2+sin(q1)^2*q2);
      cos(q1)/(cos(q1)^2+sin(q1)^2) sin(q1)/(cos(q1)^2+sin(q1)^2)];

    u=invJ*(ddpd+Kd*(dpd-J*[dq1;dq2])+Kp*(pd-p)-dJ*[dq1;dq2]);

    x=x+controller_fl_f(x,u)*dt; % Euler x
    % Frame sampling
    if frame_counter == 0
       controller_fl_draw(x,pd);
    end
    frame_counter =frame_counter+1;
    if frame_counter == 1
        frame_counter=0;
    end
end;