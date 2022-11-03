% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xdot  = f(x,alpha0,alpha1,alpham1,a0,a1,w)
    A = [0 1 0;
        -(alpha0+a0) -(alpha1 +a1) alpham1;
        -1 0 0];
    
    xdot=A*x+[0;alpha0;1]*w
end

