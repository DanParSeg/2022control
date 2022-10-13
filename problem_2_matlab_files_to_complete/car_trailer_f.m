% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  xdot  = f(x,u)
% state x = (x,y,theta,v,delta)
% control u=(u1 u2)
L=3;
Lr=5

px=x(1);
py=x(2);
theta=x(3)
thetar=x(4)
v=x(5);
delta=x(6);

xdot=[v*cos(delta)*cos(theta); v*cos(delta)*sin(theta); v*sin(delta)/L; (v*cos(delta)*sin(theta-thetar))/Lr; u(1); u(2)];
end

