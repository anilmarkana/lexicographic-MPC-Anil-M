
%% Parameter
ciin = 4;
csin = 100;
mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
k1 = 0.09*x(5)/(0.035+x(5));
k2 = 0.09*x(5)/(0.034+x(5));


%% Odes
x_dot1 = u(1) + u(2);
x_dot2 = mue*x(2) - (u(1) + u(2))*x(2)/x(1);
x_dot3 = csin*u(1)/x(1) - (u(1) + u(2))*x(3)/x(1) - mue*x(2)/0.51;
x_dot4 = pii*x(2) - (u(1) + u(2))*x(4)/x(1);
x_dot5 = ciin*u(2)/x(1) - (u(1) + u(2))*x(5)/x(1);
x_dot6 = -x(6)*k1;
x_dot7 = k2*(1- x(7));


sys = [x_dot1; x_dot2; x_dot3; x_dot4; x_dot5; x_dot6; x_dot7];

%% for x
f1x1 = 0;
f2x1 = (x(2)*(u(1) + u(2)))/x(1)^2;
f3x1 = (x(3)*(u(1) + u(2)))/x(1)^2 - (csin*u(1))/x(1)^2;
f4x1 = (x(4)*(u(1) + u(2)))/x(1)^2;
f5x1 = (x(5)*(u(1) + u(2)))/x(1)^2 - (ciin*u(2))/x(1)^2;
f6x1 = 0;
f7x1 = 0;


f1x2 = 0;
f2x2 = mue - (u(1) + u(2))/x(1);
f3x2 = -(100*mue)/51;
f4x2 = pii;
f5x2 = 0;
f6x2 = 0;
f7x2 = 0;


f1x3 = 0;
f2x3 = 0;
f3x3 =  -(u(1) + u(2))/x(1);
f4x3 = 0;
f5x3 = 0;
f6x3 = 0;
f7x3 = 0;


f1x4 = 0;
f2x4 = 0;
f3x4 = 0;
f4x4 =  -(u(1) + u(2))/x(1);
f5x4 = 0;
f6x4 = 0;
f7x4 = 0;


f1x5 = 0;
f2x5 = 0;
f3x5 = 0;
f4x5 = 0;
f5x5 = -(u(1) + u(2))/x(1);
f6x5 = 0;
f7x5 = 0;


f1x6 = 0;
f2x6 = 0;
f3x6 = 0;
f4x6 = 0;
f5x6 = 0;
f6x6 = -k1;
f7x6 = 0;


f1x7 = 0;
f2x7 = 0;
f3x7 = 0;
f4x7 = 0;
f5x7 = 0;
f6x7 = 0;
f7x7 = -k2;



sys = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1 f7x1;
       f1x2 f2x2 f3x2 f4x2 f5x2 f6x2 f7x2;
       f1x3 f2x3 f3x3 f4x3 f5x3 f6x3 f7x3;
       f1x4 f2x4 f3x4 f4x4 f5x4 f6x4 f7x4;
       f1x5 f2x5 f3x5 f4x5 f5x5 f6x5 f7x5;
       f1x6 f2x6 f3x6 f4x6 f5x6 f6x6 f7x6;
       f1x7 f2x7 f3x7 f4x7 f5x7 f6x7 f7x7];

%% for u
f1u1 = 1;
f2u1 = -x(2)/x(1);
f3u1 = csin/x(1) - x(3)/x(1);
f4u1 = -x(4)/x(1);
f5u1 = -x(5)/x(1);
f6u1 = 0;
f7u1 = 0;

f1u2 = 1;
f2u2 = -x(2)/x(1);
f3u2 = -x(3)/x(1);
f4u2 = -x(4)/x(1);
f5u2 = ciin/x(1) - x(5)/x(1);
f6u2 = 0;
f7u2 = 0;

sys = [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1 f7u1;
        f1u2 f2u2 f3u2 f4u2 f5u2 f6u2 f7u2];   
