
function  xdot  = f(x,u)

    x1=x(1);
    x2=x(2);
    x3=x(3);
    x4=x(4);

    mr=1;
    mc=5;
    l=1;
    g=9.81;
    
    f1 = x3;
    f2 = x4;
    f3 = (-mr*sin(x2)*(l*(x4)^2-g*cos(x2)))/(mc + mr*sin(x2)^2) + u/(mc + mr*sin(x2)^2);
    f4 = (sin(x2)*((mc+mr)*g-mr*l*(x4)^2*cos(x2)))/(l*(mc + mr*sin(x2)^2)) + (u*cos(x2))/(l*mc + l*mr*sin(x2)^2);

    xdot=[f1;f2;f3;f4];
end

