% Adapted from https://www.ensta-bretagne.fr/jaulin/

function  dx  = f(x,u)
    %extracting values from vectors
    x1=x(1);
    x2=x(2);
    x3=x(3);
    x4=x(4);
    u1=u(1);
    u2=u(2);

    q1=x1;
    q2=x2;
    dq1=x3;
    dq2=x4;
    
    %model parameters
    lz1=1;
    lz2=1;
    l1=1;
    l2=1;
    m1=1;
    m2=1;
    r1=l1/2;
    r2=l2/2;
    
    %expresions
    alpha=lz1+lz2+m1*r1^2+m2*(l1^2+r2^2);
    beta=m2*l1*r2;
    delta=lz2+m2*r2^2;
    
    %matrix B and C
    B=[alpha+2*beta*cos(q2) delta+beta*cos(q2);
       delta+beta*cos(q2) delta];
    invB=[(4*lz2 + m2)/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2), -(4*lz2 + m2 + 2*l1*m2*cos(q2))/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2); -(4*lz2 + m2 + 2*l1*m2*cos(q2))/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2), (4*m2*l1^2 + 4*m2*cos(q2)*l1 + 4*m1*r1^2 + 4*lz1 + 4*lz2 + m2)/(- l1^2*m2^2*cos(q2)^2 + l1^2*m2^2 + 4*lz2*l1^2*m2 + m1*m2*r1^2 + lz1*m2 + 4*lz2*m1*r1^2 + 4*lz1*lz2)];
    C=[-beta*sin(q2)*dq2 -beta*sin(q2)*(dq1+dq2);
        beta*sin(q2)*dq1 0];

    %calculate next step
    dx34=-invB*C*[x3;x4]+invB*[u1;u2];
    x1=x3;
    x2=x4;
    x3=dx34(1);
    x4=dx34(2);
    
    %return
    dx=[x1;x2;x3;x4];
end

