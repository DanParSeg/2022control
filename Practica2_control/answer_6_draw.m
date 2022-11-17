%

function f(t,x,u)
    u(1)/10000
    u(2)
    plot(t,x(1),'r--.')
    plot(t,x(2),'g--.')
    plot(t,x(3),'b--.')
    plot(t,x(4),'k--.')
    plot(t,x(5),'k--.')
    plot(t,x(6),'k--.')
    plot(t,u(1)/100000,'c--.')
    plot(t,u(2)/10,'m--.')
    legend('x','y','theta','dx','dy','dtheta','u1','u2')
end