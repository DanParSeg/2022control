syms I1 I2 m2 g l2 d2
syms q1 q2

p=[l2*cos(q1) - cos(q1)*(d2 - q2);
   l2*sin(q1) - sin(q1)*(d2 - q2)]%tip position

J=jacobian([p(1),p(2)],[q1;q2])

syms t q1(t) q2(t) dq1 dq2
J=[sin(q1)*(d2 - q2) - l2*sin(q1), cos(q1);
   l2*cos(q1) - cos(q1)*(d2 - q2), sin(q1)]
dJ = diff(J,t)

eq=["q1","dq1";
    "q2","dq2"];
derivada_t(dJ,eq)

syms t q1 q2 dq1 dq2

dJ=[cos(q1)*(d2-q2)*dq1-sin(q1)*dq2-l2*cos(q1)*dq1 -sin(q1)*dq1;
    cos(q1)*dq2+sin(q1)*(d2-q2)*dq1-l2*sin(q1)*dq1 cos(q1)*dq1]

invJ=inv(J)
invJ=[-sin(q1)/(l2*cos(q1)^2-d2*cos(q1)^2-d2*sin(q1)^2+l2*sin(q1)^2+cos(q1)^2*q2+sin(q1)^2*q2) cos(q1)/(l2*cos(q1)^2-d2*cos(q1)^2-d2*sin(q1)^2+l2*sin(q1)^2+cos(q1)^2*q2+sin(q1)^2*q2);
      cos(q1)/(cos(q1)^2+sin(q1)^2) sin(q1)/(cos(q1)^2+sin(q1)^2)]

 

function dexpr=derivada_t(expr,equiv)
    output=string(expr);
    for i=1:size(equiv,1)
        eq=equiv(i,:);
        output=strrep(output,"diff("+eq(1)+"(t), t)",eq(2)+"(t)");
    end
    output=strrep(output,"(t)","");
    output=strrep(output," ","");
    output=strrep(output,","," ");
    dexpr=output;
end