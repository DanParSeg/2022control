%Adapted from https://www.ensta-bretagne.fr/jaulin/

init;

%For this system, the state is x =(x,y,theta,v,delta)

x=[0;0;0;0;50;0]; % Initial state

dt=0.01;

frame_counter=0;

car_trailer_draw(x); 
plot(x(1), x(2),'red.','MarkerSize',12)

for t=0:dt:5
    
    u1=0;   
    u2=0.05;  


    
    %u1=-20
    %u2=0.15
    %if(x(5)<0)
    %    u1=-10
    %    u2=-0.3
    %end

    u=[u1;u2];

    x=x+car_trailer_f(x,u)*dt; % Euler
    %x=x+dt*(0.25*car_trailer_f(x,u)+0.75*(car_trailer_f(x+dt*(2/3)*car_trailer_f(x,u),u))); % Runge-Kutta
    
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 40
       car_trailer_draw(x); 
       frame_counter =0;
    end
end;


