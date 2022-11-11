%Find the operating point that corresponds to u1 = mg, u2 = 0.
% Linearize the system around this operating point.



%1 operating points
%hacia abajo o hacia arriba
%seria [0;0;0;0] y [0,pi;0;0]
%para puntos de equilibro tenemos que poner la f a 0
syms x2 x3 x4 u
l=4
mc=5
mr=1
g=9.81

%no ponemos x1 porque es la posicion del carro
S = solve(==0,x2,x3,x4,u,'Real',true)

Su=s.u
Sx2=S.x2

%linearize
%elegimos el de arriba, 0,0,0,0