% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  dxhat  = f(x,hat_x,w,y)
    % state x = (x(1),x(2))
    % control u 
    
    %x1= x(1);
    %x2= x(2);


    dxhat=-5*hat_x+w+y
end
