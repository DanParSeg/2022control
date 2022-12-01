init;

x=[0;0]; % Initial state
u=0;

dt=0.01;
frame_counter=0;
t=0;
for t=0:dt:20
    u=sin(x(1))+sin(t)-x(1)+2*(cos(t)-x(2))-sin(t)
    y=x(1)
    x=x+f(x,u)*dt;
    %pause(dt);
    frame_counter =frame_counter+1;
    % Frame sampling
    if frame_counter == 5
       draw(t,x,u);
       pause(0.00000001);
       frame_counter =0;
    end
end;

