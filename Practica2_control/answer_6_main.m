answer_6_init;
x=[1;5;0.0174533;-0.1;-0.2;0.00174533]; % Initial state
goal=[0 2.4]

%x=[0; 5; 0.0174533; -0.1; -0.2; 0.00174533];
%x=[1;5;0.4;-0.1;-0.2;0.00174533]; % Initial state

%define constants
m=30000;
d=5.5;
g=9.81;
J=10000;
u1_A=m*g;

A=[0 0 0 1 0 0;
   0 0 0 0 1 0;
   0 0 0 0 0 1;
   0 0 -u1_A/m 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0];

B=[0 0;0 0;0 0;0 0;1/m 0; 0 2*d/J];

pcontrol=0:size(A,1)-1;
separation=0.1;
offset=1;
pcontrol=(pcontrol*-separation)-offset;
pcontrol(2)=-0.1;
pcontrol
if(max(pcontrol)>0)
    print("warning, unstable")
end
E=[1 0 0 0 0 0;
   0 1 0 0 0 0];

K=place(A,B,pcontrol);

H=-inv(E*inv(A-B*K)*B);


dt=0.05;
frame_counter=0;
for t=0:dt:50
    %x_des=[10;5;0;0;0;0]
    x_bar=[0;0;0;0;0;0];
    w=[goal(1);goal(2)];
    w_bar=[0;0];
    u_bar=[m*g;0];
    %u=u_bar-K*(x-x_des)
    u=u_bar-K*(x-x_bar)+H*(w-w_bar);
    
    x=x+answer_6_f(x,u)*dt; % Euler x
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    
    
    
    % Frame sampling
    if frame_counter == 0
       answer_6_draw(t,x,u);
       %answer_6_draw_dibujo(x);
       pause(0.000000000000000000001);
    end
    t
    frame_counter =frame_counter+1;
    if frame_counter == 10
        frame_counter=0;
    end
end;


