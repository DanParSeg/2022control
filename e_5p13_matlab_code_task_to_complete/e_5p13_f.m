% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xdot  = f(x,u)
    
    xdot=[x(1)+x(2) 2*x(2)+u]
end

