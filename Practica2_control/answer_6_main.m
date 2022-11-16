% Using the pole placement method, design a state feedback controller to control
%the landing of the aircraft. We want to steer the aircraft from the state
%x = (x, y, θ, ˙x, ˙y,˙θ)
%T = (1, 5, 0.0174533, −0.1, −0.2, 0.00174533)T
%to the state x = (0, 2.4, 0, 0, 0, 0)T . 
%Give the eigenvalues that have been assigned to
%the controlled system and illustrate the behaviour of the controller by plotting
%the relevant state and control variables and by a graphical animation.


%init;
x=[1;5;0.0174533;-0.1;-0.2;0.00174533]; % Initial state
%x=[1;5;0.5;0;2;-0.3];

%define constants
m=30000;
d=5.5;
g=9.81;
S=0;%initial value of S
J=10000;

u=[m*g;0]%initial value of u



%metodo con place()
%create state space object
%sys = ss(A,B,C,D);
%step(sys)
%check open loop eigenvalues
%E=eig(A);
%solve for k using pole placement
%desired closed loop eignevalues
%P=[-1; -2; -3; -4; -5; -6;]*0.05; %no poner todos en el mismo sitio, separalos
%K=place(A,B,P);
%check for closed loop eigenvalues
%Acl = A-B*K;
%Ecl = eig(Acl);
%create closed loop system
%syscl=ss(Acl,B,C,D);
%check step response
%step(syscl)

%metodo sin usar place (no recomendado)

%syms s K
%I=eye(size(A));
%s*I-A
%B*K
%solution=solve(det(s*I-A+B*K)==(s+1)^size(A),[s K],"Real",true);
%solution.s
%solution.K


dt=0.01;
frame_counter=0;
for t=0:dt:2
    %define w
    w=[0;2.4;0;0;0;0]
    %update S for the matrix A
    S=u(1)
    %define state matrices
    A=[0 0 0 1 0 0;
       0 0 0 0 1 0;
       0 0 0 0 0 1;
       0 0 -S/m 0 0 0;
       0 0 0 0 0 0;
       0 0 0 0 0 0];
    B=[0 0;
       0 0;
       0 0;
       0 0;
       1/m 0;
       0 2*d/J];
    C=[0 1 0 0 0 0];
    D=0;
    %E matrix
    E=eye(size(A))
    %K matrix
    P=[-1; -2; -3; -4; -5; -6;]*10; %no poner todos en el mismo sitio, separalos
    K=place(A,B,P);
    %H matrix
    H=-1./(E*inv(A-B*K)*B)
    %u vector
    w_bar=E*x
    (w-w_bar)
    u=u-K*x+H*(w-w_bar)
    %u=[g*m;0]
    
    x=x+answer_6_f(x,u)*dt; % Euler x
    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    
    % Frame sampling
    if frame_counter == 0
       %e_6p4_draw(t,x,u);
       answer_6_draw_dibujo(x);
    end

    frame_counter =frame_counter+1;
    t
    x
    if frame_counter == 1
        frame_counter=0;
    end
end;


