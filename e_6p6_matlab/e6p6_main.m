% Using the pole placement method, design a state feedback controller to control
%the landing of the aircraft. We want to steer the aircraft from the state
%x = (x, y, θ, ˙x, ˙y,˙θ)
%T = (1, 5, 0.0174533, −0.1, −0.2, 0.00174533)T
%to the state x = (0, 2.4, 0, 0, 0, 0)T . 
%Give the eigenvalues that have been assigned to
%the controlled system and illustrate the behaviour of the controller by plotting
%the relevant state and control variables and by a graphical animation.


e6p6_init;

mr=1;
mc=5;
l=4;
g=9.81;

x=[0;0;0;0]; % Initial state

A=[ 0,                  0, 1, 0;
    0,                  0, 0, 1;
    0,          (g*mr)/mc, 0, 0;
    0, (g*(mc + mr))/(l*mc), 0, 0;
];

B=[0;
   0;
   1/mc;
   1/(l*mc);
];
C=[0,0,0,0]

pcontrol=[-2 -2.1 -2.2 -2.3]
E=[1 0 0 0]%seleccionamos el estado que queremos controlar
K=place(A,B,pcontrol)
H=-inv(E*inv(A-B*K)*B)

dt=0.01;
frame_counter=0;
t=0;
for t=0:dt:10
    w=square(0.5*t) %setpoint, hacia donde queremos que vaya el sistema
    u_bar=0%el estado al que tiende u cuando esta en equilibrio
    w_bar=0%
    x_bar=[0;0;0;0]%el estado de equilibrio
    %definicion de u con w y w_bar
    %u=u_bar-K*(x-x_bar)+H*(w-w_bar)
    
    %definicion de u con x_desired
    x_des=[w;0;0;0]
    u=u_bar-K*(x-x_des)

    x=x+e6p6_f(x,u)*dt % Euler x
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    
    % Frame sampling
    if frame_counter == 0
       %e6p6_draw(t,x,u,w);
       pendulum_draw(x);
    end

    frame_counter =frame_counter+1;

    if frame_counter == 5
        frame_counter=0
    end
end;


