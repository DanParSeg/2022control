syms I1 I2 m2 g l2 d2
syms q1 q2

p=[l2*cos(q1) - cos(q1)*(d2 - q2);
   l2*sin(q1) - sin(q1)*(d2 - q2)]%tip position

J=jacobian([p(1),p(2)],[q1;q2])

J=[sin(q1)*(d2 - q2) - l2*sin(q1), cos(q1);
   l2*cos(q1) - cos(q1)*(d2 - q2), sin(q1)]

invdJ=[                                                                    -cos(q1)/(dq1*l2*cos(q1)^2 - d2*dq1*cos(q1)^2 + dq1*q2*cos(q1)^2 - d2*dq1*sin(q1)^2 + dq1*l2*sin(q1)^2 + dq1*q2*sin(q1)^2),                                                                     -sin(q1)/(dq1*l2*cos(q1)^2 - d2*dq1*cos(q1)^2 + dq1*q2*cos(q1)^2 - d2*dq1*sin(q1)^2 + dq1*l2*sin(q1)^2 + dq1*q2*sin(q1)^2);
       (dq2*cos(q1) + d2*dq1*sin(q1) - dq1*l2*sin(q1) - dq1*q2*sin(q1))/(dq1^2*l2*cos(q1)^2 - d2*dq1^2*cos(q1)^2 + dq1^2*q2*cos(q1)^2 - d2*dq1^2*sin(q1)^2 + dq1^2*l2*sin(q1)^2 + dq1^2*q2*sin(q1)^2), (dq2*sin(q1) + dq1*l2*cos(q1) + dq1*q2*cos(q1) - d2*dq1*cos(q1))/(dq1^2*l2*cos(q1)^2 - d2*dq1^2*cos(q1)^2 + dq1^2*q2*cos(q1)^2 - d2*dq1^2*sin(q1)^2 + dq1^2*l2*sin(q1)^2 + dq1^2*q2*sin(q1)^2)]
