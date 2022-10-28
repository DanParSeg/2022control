% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xdot  = f(x,u)
    % state x = (x(1),x(2))
    % control u 
    
    %x1= x(1);
    %x2= x(2);
    
    xdot=3*x+2*u
end

