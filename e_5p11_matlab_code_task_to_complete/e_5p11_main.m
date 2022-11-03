%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

%For this system, the state is x =(x1,x2)

z=0; %estado del integrador
x=[0;0;z]; % Initial state

dt=0.01;
frame_counter=0;
t=0;

alpha0=1  %proporcional
alpha1=1  %derivativo
alpham1=1 %integral

a0=2
a1=2

for t=0:dt:10
    x1=x(1)
    x2=x(2)
    z=x(3)

    w=1 %w is constant, input, estado en el que se estabiliza
    y=x1
    u=alpham1*z+alpha0*w-alpha0*x1-alpha1*x2 %control
    x=x+e_5p11_f(x,alpha0,alpha1,alpham1,a0,a1,w)*dt % Euler x

    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    %pause(dt);
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 10
       e_5p11_draw(t,x,u);
       frame_counter =0;
    end
end;


