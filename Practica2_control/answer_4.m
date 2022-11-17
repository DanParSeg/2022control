syms J m d g x1 x2 x3 x4 x5 x6 u1 u2

A=[x4;x5;x6;-u1*(sin(x3)/m);-g+u1*(cos(x3))/m;0];

B=[0 0;
   0 0;
   0 0;
   -sin(x3)/m 0;
   cos(x3)/m 0;
   0 2*d/J];

u=[u1;u2];

dx=A+B*u;

A = jacobian(dx,[x1;x2;x3;x4;x5;x6]);
B = jacobian(dx,[u1;u2]);

A=subs(A,[x1 x2 x3 x4 x5 x6], [0 0 0 0 0 0])
B=subs(B,[x1 x2 x3 x4 x5 x6], [0 0 0 0 0 0])
