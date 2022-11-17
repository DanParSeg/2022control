syms J m d g x1 x2 x3 x4 x5 x6 u1 u2
A=[x4;x5;x6;0;-g;0]

B=[0 0;
   0 0;
   0 0;
   -sin(x3)/m 0;
   cos(x3)/m 0;
   0 2*d/J]

u=[u1;u2];
dx=A+B*u;

S = solve(dx(1)==0,dx(2)==0,dx(3)==0,dx(4)==0,dx(5)==0,dx(6)==0,x1,x2,x3,x4,x5,x6,u1,u2,'Real',true);

Su=[S.u1;S.u2]
Sx=[S.x1;S.x2;S.x3;S.x4;S.x5;S.x6]
