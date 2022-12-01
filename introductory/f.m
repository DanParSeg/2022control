% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  dx  = f(x,u)
    dx=[x(2);-sin(x(1))+u]
end

