function sys = process(t,x,flag,u,p)
% PROCESS -  returns the description of optimised process with respect to
% given flag.



switch flag,
    case 0 % right sides of ODE/DAEs: f(x,u,p,t)
        %Parameter
        k1 = 1659900;
        k2 = 72117e4;
        k3 = 144234e4;
        k4 = 133725e7;
        k5 = 401175e7;
        k6 = 26745e8;
        k7 = 3319800;
        k8 = 104656218.9;
        k9 = 27285184270;
        k10 = 1446556764e5;
        l1 = 0.0002434546857;
        Tf = 35;
        eta1 = exp(-6666.7/(x(7)+273.15));
        eta2 = exp(-8333.3/(x(7)+273.15));
        eta3 = exp(-11111/(x(7)+273.15));
        x_dot1 = -x(1)*u(1)/(1000*x(8)) - k1*eta1*x(1)*x(2);
        x_dot2 = (1-x(2))*u(1)/(1000*x(8)) + k1*eta1*x(1)*x(2) - k2*eta2*x(2)*x(3);
        x_dot3 = -x(3)*u(1)/(1000*x(8)) + k7*eta1*x(1)*x(2) - k3*eta2*x(2)*x(3) - k6*eta3*x(3)*x(4);
        x_dot4 = -x(4)*u(1)/(1000*x(8)) + k2*eta2*x(2)*x(3) - k4*eta3*x(3)*x(4);
        x_dot5 = -x(5)*u(1)/(1000*x(8)) + k3*eta2*x(2)*x(3);
        x_dot6 = -x(6)*u(1)/(1000*x(8)) + k3*eta3*x(3)*x(4);
        x_dot7 = (Tf - x(7))*u(1)/(1000*x(8)) + k8*eta1*x(1)*x(2) + k9*eta2*x(2)*x(3) + k10*eta3*x(3)*x(4) - l1*(x(7) - 1000*u(2));
        x_dot8 = u(1)/1000;
        sys = [x_dot1;x_dot2;x_dot3;x_dot4;x_dot5;x_dot6;x_dot7;x_dot8];
    case 1 % gradients of f with respect to x: df/dx
        k1 = 1659900;
        k2 = 72117e4;
        k3 = 144234e4;
        k4 = 133725e7;
        k5 = 401175e7;
        k6 = 26745e8;
        k7 = 3319800;
        k8 = 104656218.9;
        k9 = 27285184270;
        k10 = 1446556764e5;
        l1 = 0.0002434546857;
        Tf = 35;
        eta1 = exp(-6666.7/(x(7)+273.15));
        eta2 = exp(-8333.3/(x(7)+273.15));
        eta3 = exp(-11111/(x(7)+273.15));
        
        f1x1 = - u(1)/(1000*x(8)) - eta1*k1*x(2);
        f2x1 = eta1*k1*x(2);
        f3x1 = eta1*k7*x(2);
        f4x1 = 0;
        f5x1 = 0;
        f6x1 = 0;
        f7x1 = eta1*k8*x(2);
        f8x1 = 0;
        
        f1x2 = -eta1*k1*x(1);
        f2x2 = eta1*k1*x(1) - u(1)/(1000*x(8)) - eta2*k2*x(3);
        f3x2 = eta1*k7*x(1) - eta2*k3*x(3);
        f4x2 = eta2*k2*x(3);
        f5x2 = eta2*k3*x(3);
        f6x2 = 0;
        f7x2 = eta1*k8*x(1) + eta2*k9*x(3);
        f8x2 = 0;
        
        f1x3 = 0;
        f2x3 = -eta2*k2*x(2);
        f3x3 = - u(1)/(1000*x(8)) - eta2*k3*x(2) - eta3*k6*x(4);
        f4x3 = eta2*k2*x(2) - eta3*k4*x(4);
        f5x3 = eta2*k3*x(2);
        f6x3 = eta3*k3*x(4);
        f7x3 = eta3*k10*x(4) + eta2*k9*x(2);
        f8x3 = 0;
        
        
        f1x4 = 0;
        f2x4 = 0;
        f3x4 = -eta3*k6*x(3);
        f4x4 = - u(1)/(1000*x(8)) - eta3*k4*x(3);
        f5x4 = 0;
        f6x4 = eta3*k3*x(3);
        f7x4 = eta3*k10*x(3);
        f8x4 = 0;
        
        f1x5 = 0;
        f2x5 = 0;
        f3x5 = 0;
        f4x5 = 0;
        f5x5 = -u(1)/(1000*x(8));
        f6x5 = 0;
        f7x5 = 0;
        f8x5 = 0;
        
        f1x6 = 0;
        f2x6 = 0;
        f3x6 = 0;
        f4x6 = 0;
        f5x6 = 0;
        f6x6 = -u(1)/(1000*x(8));
        f7x6 = 0;
        f8x6 = 0;
        
        f1x7 = 0;
        f2x7 = 0;
        f3x7 = 0;
        f4x7 = 0;
        f5x7 = 0;
        f6x7 = 0;
        f7x7 = - l1 - u(1)/(1000*x(8));
        f8x7 = 0;
        
        f1x8 = (u(1)*x(1))/(1000*x(8)^2);
        f2x8 = (u(1)*(x(2) - 1))/(1000*x(8)^2);
        f3x8 = (u(1)*x(3))/(1000*x(8)^2);
        f4x8 = (u(1)*x(4))/(1000*x(8)^2);
        f5x8 = (u(1)*x(5))/(1000*x(8)^2);
        f6x8 = (u(1)*x(6))/(1000*x(8)^2);
        f7x8 = -(u(1)*(Tf - x(7)))/(1000*x(8)^2);
        f8x8 = 0;
        
        
        sys = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1 f7x1 f8x3;
            f1x2 f2x2 f3x2 f4x2 f5x2 f6x2 f7x2 f8x3;
            f1x3 f2x3 f3x3 f4x3 f5x3 f6x3 f7x3 f8x3;
            f1x4 f2x4 f3x4 f4x4 f5x4 f6x4 f7x4 f8x4;
            f1x5 f2x5 f3x5 f4x5 f5x5 f6x5 f7x5 f8x5;
            f1x6 f2x6 f3x6 f4x6 f5x6 f6x6 f7x6 f8x6;
            f1x7 f2x7 f3x7 f4x7 f5x7 f6x7 f7x7 f8x7;
            f1x8 f2x8 f3x8 f4x8 f5x8 f6x8 f7x8 f8x8];
        
        
    case 2 % gradients of f with respect to u: df/du
        k1 = 1659900;
        k2 = 72117e4;
        k3 = 144234e4;
        k4 = 133725e7;
        k5 = 401175e7;
        k6 = 26745e8;
        k7 = 3319800;
        k8 = 104656218.9;
        k9 = 27285184270;
        k10 = 1446556764e5;
        l1 = 0.0002434546857;
        Tf = 35;
        eta1 = exp(-6666.7/(x(7)+273.15));
        eta2 = exp(-8333.3/(x(7)+273.15));
        eta3 = exp(-11111/(x(7)+273.15));
        
        f1u1 = -x(1)/(1000*x(8));
        f2u1 = -(x(2) - 1)/(1000*x(8));
        f3u1 = -x(3)/(1000*x(8));
        f4u1 = -x(4)/(1000*x(8));
        f5u1 = -x(5)/(1000*x(8));
        f6u1 = -x(6)/(1000*x(8));
        f7u1 = (Tf - x(7))/(1000*x(8));
        f8u1 = 1/1000;
        
        f1u2 = 0;
        f2u2 = 0;
        f3u2 = 0;
        f4u2 = 0;
        f5u2 = 0;
        f6u2 = 0;
        f7u2 = 1000*l1;
        f8u2 = 0;
        
        sys = [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1 f7u1 f8u1;
            f1u2 f2u2 f3u2 f4u2 f5u2 f6u2 f7u2 f8u2];
        
    case 3 % gradients of f with respect to p: df/dp
        sys = [];
    case 4 % gradients of f with respect to t: df/dt
        sys = [];
    case 5 % initial condition: x0
        sys = [0.99999;0.0000001;0.0000001;0.0000001;0.0000001;0.0000001;65;2.000001];
    case 6 % gradients of x0 with respect to p: dx0/dp
        sys = [];
    case 7 % mass matrix M
        sys = [];
    case 8 % unused flag, don't use it !!!
        sys = []; % this flag will be maybe used in next version
    otherwise
        error(['unhandled flag = ',num2str(flag)]);
end