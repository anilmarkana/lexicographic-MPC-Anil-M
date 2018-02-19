function sys = process_shmpc(t,x,flag,u,p)



switch flag,
    case 0 % f(x,u,p,t)
        c1=100;
        c2=0.51;
        c3=4;

        t1=14.35+x(3)+x(3)*x(3)/111.5;
        t2=0.22+x(5);
        t3=x(6)+0.22*x(7)/t2;

        g1=x(3)/t1*(x(6)+x(7)*0.22/t2);
        g2=0.233*x(3)/t1*((0.0005+x(5))/(0.022+x(5)));
        g3=0.09*x(5)/(0.034+x(5));
        sys = [u(1)+u(2);g1*x(2)-(u(1)+u(2))*x(2)/x(1);u(1)/x(1)*c1-(u(1)+u(2))*x(3)/x(1)-g1*x(2)/c2;g2*x(2)-(u(1)+u(2))*x(4)/x(1);u(2)*c3/x(1)-(u(1)+u(2))*x(5)/x(1);-g3*x(6);g3*(1-x(7))];
    case 1 % df/dx
        c1=100;
        c2=0.51;
        c3=4;

        t1=14.35+x(3)+x(3)*x(3)/111.5;
        t2=0.22+x(5);
        t3=x(6)+0.22*x(7)/t2;

        g1=x(3)/t1*(x(6)+x(7)*0.22/t2);
        g2=0.233*x(3)/t1*((0.0005+x(5))/(0.022+x(5)));
        g3=0.09*x(5)/(0.034+x(5));

        %%%%%%%%%%%%%%%%%%%%%%%%%%
        f1x1 = 0;
        f2x1 = (x(2)*(u(1) + u(2)))/x(1)^2;
        f3x1 = (x(3)*(u(1) + u(2)))/x(1)^2 - (c1*u(1))/x(1)^2;
        f4x1 = (x(4)*(u(1) + u(2)))/x(1)^2;
        f5x1 = (x(5)*(u(1) + u(2)))/x(1)^2 - (c3*u(2))/x(1)^2;
        f6x1 = 0;
        f7x1 = 0;


        f1x2 = 0;
        f2x2 = (x(3)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/((2*x(3)^2)/223 + x(3) + 287/20) - (u(1) + u(2))/x(1);
        f3x2 = -(x(3)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/(c2*((2*x(3)^2)/223 + x(3) + 287/20));
        f4x2 = (233*x(3)*(x(5) + 1/2000))/(1000*(x(5) + 11/500)*((2*x(3)^2)/223 + x(3) + 287/20));
        f5x2 = 0;
        f6x2 = 0;
        f7x2 = 0;

        f1x3 = 0;
        f2x3 = (x(2)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/((2*x(3)^2)/223 + x(3) + 287/20) - (x(2)*x(3)*((4*x(3))/223 + 1)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/((2*x(3)^2)/223 + x(3) + 287/20)^2;
        f3x3 = (x(2)*x(3)*((4*x(3))/223 + 1)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/(c2*((2*x(3)^2)/223 + x(3) + 287/20)^2) - (x(2)*(x(6) + (11*x(7))/(50*(x(5) + 11/50))))/(c2*((2*x(3)^2)/223 + x(3) + 287/20)) - (u(1) + u(2))/x(1);
        f4x3 = (233*x(2)*(x(5) + 1/2000))/(1000*(x(5) + 11/500)*((2*x(3)^2)/223 + x(3) + 287/20)) - (233*x(2)*x(3)*((4*x(3))/223 + 1)*(x(5) + 1/2000))/(1000*(x(5) + 11/500)*((2*x(3)^2)/223 + x(3) + 287/20)^2);
        f5x3 = 0;
        f6x3 = 0;
        f7x3 = 0;

        f1x4 = 0;
        f2x4 = 0;
        f3x4 = 0;
        f4x4 = -(u(1) + u(2))/x(1);
        f5x4 = 0;
        f6x4 = 0;
        f7x4 = 0;

        f1x5 = 0;
        f2x5 = -(11*x(2)*x(3)*x(7))/(50*(x(5) + 11/50)^2*((2*x(3)^2)/223 + x(3) + 287/20));
        f3x5 = (11*x(2)*x(3)*x(7))/(50*c2*(x(5) + 11/50)^2*((2*x(3)^2)/223 + x(3) + 287/20));
        f4x5 = (233*x(2)*x(3))/(1000*(x(5) + 11/500)*((2*x(3)^2)/223 + x(3) + 287/20)) - (233*x(2)*x(3)*(x(5) + 1/2000))/(1000*(x(5) + 11/500)^2*((2*x(3)^2)/223 + x(3) + 287/20));
        f5x5 = -(u(1) + u(2))/x(1);
        f6x5 = (9*x(5)*x(6))/(100*(x(5) + 17/500)^2) - (9*x(6))/(100*(x(5) + 17/500));
        f7x5 = (9*x(5)*(x(7) - 1))/(100*(x(5) + 17/500)^2) - (9*(x(7) - 1))/(100*(x(5) + 17/500));

        f1x6 = 0;
        f2x6 = (x(2)*x(3))/((2*x(3)^2)/223 + x(3) + 287/20);
        f3x6 = -(x(2)*x(3))/(c2*((2*x(3)^2)/223 + x(3) + 287/20));
        f4x6 = 0;
        f5x6 = 0;
        f6x6 = -(9*x(5))/(100*(x(5) + 17/500));
        f7x6 = 0;

        f1x7 = 0;
        f2x7 = (11*x(2)*x(3))/(50*(x(5) + 11/50)*((2*x(3)^2)/223 + x(3) + 287/20));
        f3x7 = -(11*x(2)*x(3))/(50*c2*(x(5) + 11/50)*((2*x(3)^2)/223 + x(3) + 287/20));
        f4x7 = 0;
        f5x7 = 0;
        f6x7 = 0;
        f7x7 = -(9*x(5))/(100*(x(5) + 17/500));

        sys = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1 f7x1;
            f1x2 f2x2 f3x2 f4x2 f5x2 f6x2 f7x2;
            f1x3 f2x3 f3x3 f4x3 f5x3 f6x3 f7x3;
            f1x4 f2x4 f3x4 f4x4 f5x4 f6x4 f7x4;
            f1x5 f2x5 f3x5 f4x5 f5x5 f6x5 f7x5;
            f1x6 f2x6 f3x6 f4x6 f5x6 f6x6 f7x6;
            f1x7 f2x7 f3x7 f4x7 f5x7 f6x7 f7x7];
      
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
    case 2 % df/du
        c1=100;
        c2=0.51;
        c3=4;

        t1=14.35+x(3)+x(3)*x(3)/111.5;
        t2=0.22+x(5);
        t3=x(6)+0.22*x(7)/t2;

        g1=x(3)/t1*(x(6)+x(7)*0.22/t2);
        g2=0.233*x(3)/t1*((0.0005+x(5))/(0.022+x(5)));
        g3=0.09*x(5)/(0.034+x(5));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        f1u1 = 1;
        f2u1 = -x(2)/x(1);
        f3u1 = c1/x(1) - x(3)/x(1);
        f4u1 = -x(4)/x(1);
        f5u1 = -x(5)/x(1);
        f6u1 = 0;
        f7u1 = 0;

        f1u2 = 1;
        f2u2 = -x(2)/x(1);
        f3u2 = -x(3)/x(1);
        f4u2 = -x(4)/x(1);
        f5u2 = c3/x(1) - x(5)/x(1);
        f6u2 = 0;
        f7u2 = 0;

        sys= [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1 f7u1;
            f1u2 f2u2 f3u2 f4u2 f5u2 f6u2 f7u2];

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
       
        
    case 3 % df/dp
        sys = [];
    case 4 % df/dt
        sys = [];
    case 5 % x0
         load('atm.mat')
        sys = initial_state;
    case 6 % dx0/dp
        sys = [];
    case 7 % M
        sys = [];
    case 8 % unused flag
        sys = [];
    otherwise
        error(['unhandled flag = ',num2str(flag)]);
end