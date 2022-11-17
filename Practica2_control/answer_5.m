% Is the linearized system controllable using both control inputs u1 and u2?
% Is the linearized system controllable using only the control input u1?

m=30000;
d=5.5;
g=9.81;
J=10000;
u1_A=m*g;

A=[0 0 0 1 0 0;
   0 0 0 0 1 0;
   0 0 0 0 0 1;
   0 0 -u1_A/m 0 0 0;
   0 0 0 0 0 0;
   0 0 0 0 0 0];

B=[0 0;0 0;0 0;0 0;1/m 0; 0 2*d/J];

B_without_u2=[0 0;0 0;0 0;0 0;1/m 0; 0 0];

Co=ctrb(A,B);

uncontrollable_states = length(A) - rank(Co)

Co=ctrb(A,B_without_u2);

uncontrollable_states = length(A) - rank(Co)