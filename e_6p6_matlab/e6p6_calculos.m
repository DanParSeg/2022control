%1 operating points
%para puntos de equilibro tenemos que poner la f a 0
syms x2 x3 x4 u
l=4;
mc=5;
mr=1;
g=9.81;

f1 = x3;
f2 = x4;
f3 = (-mr*sin(x2)*(l*(x4)^2-g*cos(x2)))/(mc + mr*sin(x2)^2) + u/(mc + mr*sin(x2)^2);
f4 = (sin(x2)*((mc+mr)*g-mr*l*(x4)^2*cos(x2)))/l*(mc + mr*sin(x2)^2) + (u*cos(x2))/(l*mc + mr*sin(x2)^2);

dx=[f1,f2,f3,f4]


%no ponemos x1 porque es la posicion del carro
S = solve(dx(1)==0,dx(2)==0,dx(3)==0,dx(4)==0,x2,x3,x4,u,'Real',true);

%obtenemos la solucion [u,x2]=[0,0] y [0,pi]
Su=S.u
Sx2=S.x2

%pause(100)

%linearize
%elegimos la posicion up x=[0,0,0,0] u=0
% derivadas parciales y sustituir puntos de equilibrio
clear all
close all
clc

syms l mc mr g x1 x2 x3 x4 u

f1 = x3;
f2 = x4;
f3 = (-mr*sin(x2)*(l*(x4)^2-g*cos(x2)))/(mc + mr*sin(x2)^2) + u/(mc + mr*sin(x2)^2);
f4 = (sin(x2)*((mc+mr)*g-mr*l*(x4)^2*cos(x2)))/l*(mc + mr*sin(x2)^2) + (u*cos(x2))/(l*mc + mr*sin(x2)^2);

dx=[f1,f2,f3,f4]

A = jacobian([f1,f2,f3,f4],[x1,x2,x3,x4])
B = jacobian([f1,f2,f3,f4],u)

subs(A,[x1 x2 x3 x4], [0 0 0 0])
subs(B,[x1 x2 x3 x4], [0 0 0 0])

%output feedback controller, poles in -2
clear all
close all
clc

