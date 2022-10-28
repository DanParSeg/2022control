%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

%For this system, the state is x =(x1,x2)

x=0.25; % Initial state

hat_x=2.75 %Initial observer state

w_bar=5

dt=0.01;

frame_counter=0;

t=0;

k=2

e_5p8_draw(t,x,hat_x);

for t=0:dt:10
    y=x*4
    
    w = t/2*sin(t)+3 %input, estado en el que se estabiliza

    u=-2*hat_x + w/2 %control

    x=x+e_5p8_f(x,u)*dt % Euler x

    hat_x=hat_x+e_5p8_f_observer(x,hat_x,w,y)*dt; % Euler hat_x

    %x=x+dt*(0.25*e_5p7_f(x,u)+0.75*(e_5p7_f(x+dt*(2/3)*e_5p7_f(x,u),u))); % Runge-Kutta
    
    %pause(dt);
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       e_5p8_draw(t,x,hat_x); 
       frame_counter =0;
    end
end;


