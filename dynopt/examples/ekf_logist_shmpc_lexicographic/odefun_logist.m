function x_dot = odefun_logist(t, x, u)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ciin = 4.1;
csin = 100;
mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
k1 = 0.085*x(5)/(0.034+x(5));
k2 = 0.085*x(5)/(0.034+x(5));

x_dot(1,1) = u(1) + u(2);
x_dot(2,1) = mue*x(2) - (u(1) + u(2))*x(2)/x(1);
x_dot(3,1) = csin*u(1)/x(1) - (u(1) + u(2))*x(3)/x(1) - mue*x(2)/0.51;
x_dot(4,1)= pii*x(2) - (u(1) + u(2))*x(4)/x(1);
x_dot(5,1) = ciin*u(2)/x(1) - (u(1) + u(2))*x(5)/x(1);
x_dot(6,1)= -x(6)*k1;
x_dot(7,1)= k2*(1- x(7));
x_dot(8,1)= u(2);


