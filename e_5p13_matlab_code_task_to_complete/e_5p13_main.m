%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

%For this system, the state is x =(x1,x2)

x=[0,0]; % Initial state

dt=0.01;

frame_counter=0;

t=0;
z=0; %estado del integrador


alpha=1
k=[7 6]

for t=0:dt:10
    w=1 %w is constant, input, estado en el que se estabiliza
    y=x(1)
    u=-k(1)*x(1) - k(2)*x(2) +alpha*z %control
    %w = t/2*sin(t)+3 %input, estado en el que se estabiliza
    
    

    x=x+e_5p13_f(x,u)*dt % Euler x
    z=z+e_5p13_f_z(x,w)*dt %Euler z

    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    %pause(dt);
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p13_draw(t,x,z);
       frame_counter =0;
    end
end;


