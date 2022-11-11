%Using the pole placement method, design a state feedback controller to control
%a lateral dispacement of the aircraft. We want to steer the aircraft from the
%state x = (x, y, θ, ˙x, ˙y,˙θ)
%T = (0, 5, 0.0174533, −0.1, −0.2, 0.00174533)T 
%to the state x = (10, 5, 0, 0, 0, 0)T . Give the eigenvalues that have been assigned
%to the controlled system and illustrate the behaviour of the controller by
%plotting the relevant state and control variables and by a graphical animation.


init;
x=[0;0;0;0]; % Initial state
%s,theta,ds,dtheta

k=[2 1] %To calculate K, we solve: det(sI − A + BK) = (s + 1)2

dt=0.01;
frame_counter=0;
t=0;
for t=0:dt:10
    u=-k(1)*x(1) - k(2)*x(2) + 2*pi %control
    
    x=x+e_6p4_f(x,u)*dt % Euler x
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    
    % Frame sampling
    if frame_counter == 0
       %e_6p4_draw(t,x,u);
       pendulum_draw(x);
    end

    frame_counter =frame_counter+1

    if frame_counter == 1
        frame_counter=0
    end
end;


