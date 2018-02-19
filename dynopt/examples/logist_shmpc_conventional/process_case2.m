function sys = process_case2(t,x,flag,u,p)
% PROCESS -  returns the description of optimised process with respect to
% given flag.


switch flag,
    case 0 % right sides of ODE/DAEs: f(x,u,p,t)
        %Parameter
        ciin = 4;
        csin = 100;
        mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
        pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
        k1 = 0.09*x(5)/(0.034+x(5));
        k2 = 0.09*x(5)/(0.034+x(5));
        
        x_dot1 = u(1) + u(2);
        x_dot2 = mue*x(2) - (u(1) + u(2))*x(2)/x(1);
        x_dot3 = csin*u(1)/x(1) - (u(1) + u(2))*x(3)/x(1) - mue*x(2)/0.51;
        x_dot4 = pii*x(2) - (u(1) + u(2))*x(4)/x(1);
        x_dot5 = ciin*u(2)/x(1) - (u(1) + u(2))*x(5)/x(1);
        x_dot6 = -x(6)*k1;
        x_dot7 = k2*(1- x(7));
        x_dot8 = u(2);
        
        
        sys = [x_dot1; x_dot2; x_dot3; x_dot4; x_dot5; x_dot6; x_dot7;x_dot8];
        
    case 1 % gradients of f with respect to x: df/dx
        ciin = 4;
        csin = 100;
        mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
        pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
        k1 = 0.09*x(5)/(0.034+x(5));
        k2 = 0.09*x(5)/(0.034+x(5));
        
        f1x1 = 0;
        f2x1 = (x(2)*(u(1) + u(2)))/x(1)^2;
        f3x1 = (x(3)*(u(1) + u(2)))/x(1)^2 - (csin*u(1))/x(1)^2;
        f4x1 = (x(4)*(u(1) + u(2)))/x(1)^2;
        f5x1 = (x(5)*(u(1) + u(2)))/x(1)^2 - (ciin*u(2))/x(1)^2;
        f6x1 = 0;
        f7x1 = 0;
        f8x1 = 0;
        
        
        f1x2 = 0;
        f2x2 = mue - (u(1) + u(2))/x(1);
        f3x2 = -(100*mue)/51;
        f4x2 = pii;
        f5x2 = 0;
        f6x2 = 0;
        f7x2 = 0;
         f8x2 = 0;
        
        
        f1x3 = 0;
        f2x3 = 0;
        f3x3 =  -(u(1) + u(2))/x(1);
        f4x3 = 0;
        f5x3 = 0;
        f6x3 = 0;
        f7x3 = 0;
        f8x3 = 0;
        
        
        f1x4 = 0;
        f2x4 = 0;
        f3x4 = 0;
        f4x4 =  -(u(1) + u(2))/x(1);
        f5x4 = 0;
        f6x4 = 0;
        f7x4 = 0;
         f8x4 = 0;
        
        
        f1x5 = 0;
        f2x5 = 0;
        f3x5 = 0;
        f4x5 = 0;
        f5x5 = -(u(1) + u(2))/x(1);
        f6x5 = 0;
        f7x5 = 0;
         f8x5 = 0;
        
        
        f1x6 = 0;
        f2x6 = 0;
        f3x6 = 0;
        f4x6 = 0;
        f5x6 = 0;
        f6x6 = -k1;
        f7x6 = 0;
         f8x6 = 0;
        
        
        f1x7 = 0;
        f2x7 = 0;
        f3x7 = 0;
        f4x7 = 0;
        f5x7 = 0;
        f6x7 = 0;
        f7x7 = -k2;
         f8x7 = -k2;
         
         f1x8 = 0;
        f2x8 = 0;
        f3x8 = 0;
        f4x8 = 0;
        f5x8 = 0;
        f6x8 = 0;
        f7x8 = 0;
         f8x8 = 0;
        
        
        
        sys = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1 f7x1 f8x1;
            f1x2 f2x2 f3x2 f4x2 f5x2 f6x2 f7x2 f8x2;
            f1x3 f2x3 f3x3 f4x3 f5x3 f6x3 f7x3 f8x3;
            f1x4 f2x4 f3x4 f4x4 f5x4 f6x4 f7x4 f8x4;
            f1x5 f2x5 f3x5 f4x5 f5x5 f6x5 f7x5 f8x5;
            f1x6 f2x6 f3x6 f4x6 f5x6 f6x6 f7x6 f8x6;
            f1x7 f2x7 f3x7 f4x7 f5x7 f6x7 f7x7 f8x7;
            f1x8 f2x8 f3x8 f4x8 f5x8 f6x8 f7x8 f8x8];
        
        
        
    case 2 % gradients of f with respect to u: df/du
        
        ciin = 4;
        csin = 100;
        mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
        pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
        k1 = 0.09*x(5)/(0.034+x(5));
        k2 = 0.09*x(5)/(0.034+x(5));
        
        f1u1 = 1;
        f2u1 = -x(2)/x(1);
        f3u1 = csin/x(1) - x(3)/x(1);
        f4u1 = -x(4)/x(1);
        f5u1 = -x(5)/x(1);
        f6u1 = 0;
        f7u1 = 0;
         f8u1 = 0;
        
        f1u2 = 1;
        f2u2 = -x(2)/x(1);
        f3u2 = -x(3)/x(1);
        f4u2 = -x(4)/x(1);
        f5u2 = ciin/x(1) - x(5)/x(1);
        f6u2 = 0;
        f7u2 = 0;
        f8u2 = 1;
        
        sys = [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1 f7u1 f8u1;
            f1u2 f2u2 f3u2 f4u2 f5u2 f6u2 f7u2 f8u2];
        
    case 3 % gradients of f with respect to p: df/dp
        sys = [];
    case 4 % gradients of f with respect to t: df/dt
        sys = [];
    case 5 % initial condition: x0
        sys = [1;0.1;40;0;0;1;0;0];
    case 6 % gradients of x0 with respect to p: dx0/dp
        sys = [];
    case 7 % mass matrix M
        sys = [];
    case 8 % unused flag, don't use it !!!
        sys = []; % this flag will be maybe used in next version
    otherwise
        error(['unhandled flag = ',num2str(flag)]);
end