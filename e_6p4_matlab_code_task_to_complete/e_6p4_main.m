%Adapted from https://www.ensta-bretagne.fr/jaulin/

%init;

%x=[0;0]; % Initial state
x=[pi-15/180*pi;-5/180*pi]
%x=[-pi-0.001;0]
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


