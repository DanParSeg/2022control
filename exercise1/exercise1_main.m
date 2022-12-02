init;

x=[0;pi/2]; % Initial state
u=[0;0]; %control
y=[0;0]; %output

l1=1
l2=1
c=[1;1]
r=1/2

dt=0.01;
frame_counter=0;
t=0;
for t=0:dt:100
    w=c+r*[cos(t);sin(t)]%setpoint
    x1=x(1);
    x2=x(2);
    y=[l1*cos(x(1))+l2*cos(x(1)+x(2));l1*sin(x(1))+l2*sin(x(1)+x(2))]
    A = [-l1 * sin(x1) - l2* sin(x1 +x2), - l2 *sin(x1 + x2);
         l1 *cos(x1) + l2 *cos(x1 +x2), l2 *cos(x1 + x2)];
    dw=r*[-sin(t);cos(t)];
    v=(w-y)+dw; %pd controller that places eig at -1
    
    u=inv(A)*v;

    x=x+f(x,u)*dt;
    %pause(dt);
    frame_counter =frame_counter+1;
    % Frame sampling
    if frame_counter == 5
       
       draw(t,x,u,w);
       pause(0.00000001);
       frame_counter =0;
    end
end;

