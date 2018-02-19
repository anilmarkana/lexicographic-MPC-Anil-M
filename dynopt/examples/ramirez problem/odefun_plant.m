function x_dot = odefun_plant(tt, x, inpu)

%%%%

if tt>=0 & tt<1
       u(1)= inpu(1,1);
       u(2)= inpu(2,1);
   elseif tt>=1 & tt<2
       u(1)= inpu(1,2);
       u(2)= inpu(2,2);
   elseif tt>=2 & tt<3
       u(1)= inpu(1,3);
       u(2)= inpu(2,3);
   elseif tt>=3 & tt<4
       u(1)= inpu(1,4);
       u(2)= inpu(2,4);
   elseif tt>=4 & tt<5
       u(1)= inpu(1,5);
       u(2)= inpu(2,5);
   elseif tt>=5 & tt<6
       u(1)= inpu(1,6);
       u(2)= inpu(2,6);
   elseif tt>=6 & tt<7
       u(1)= inpu(1,7);
       u(2)= inpu(2,7);
   elseif tt>=7 & tt<8
       u(1)= inpu(1,8);
       u(2)= inpu(2,8);
   elseif tt>=8 & tt<9
       u(1)= inpu(1,9);
       u(2)= inpu(2,9);
   elseif tt>=9 & tt<10
       u(1)= inpu(1,10);
       u(2)= inpu(2,10);

%%%%

 c1=100;
        c2=0.51;
        c3=4;

        t1=14.35+x(3)+x(3)*x(3)/111.5;
        t2=0.22+x(5);
        t3=x(6)+0.22*x(7)/t2;

        g1=x(3)/t1*(x(6)+x(7)*0.22/t2);
        g2=0.233*x(3)/t1*((0.0005+x(5))/(0.022+x(5)));
        g3=0.09*x(5)/(0.034+x(5));
u=inpu;
x_dot(1,1)=u(1)+u(2);
x_dot(2,1)=g1*x(2)-(u(1)+u(2))*x(2)/x(1);
x_dot(3,1)=u(1)/x(1)*c1-(u(1)+u(2))*x(3)/x(1)-g1*x(2)/c2;
x_dot(4,1)=g2*x(2)-(u(1)+u(2))*x(4)/x(1);
x_dot(5,1)=u(2)*c3/x(1)-(u(1)+u(2))*x(5)/x(1);
x_dot(6,1)=-g3*x(6);
x_dot(7,1)=g3*(1-x(7));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% if tt>=0 & tt<1
%        u(1)= inpu(1,1);
%        u(2)= inpu(2,1);
%    elseif tt>=1 & tt<2
%        u(1)= inpu(1,2);
%        u(2)= inpu(2,2);
%    elseif tt>=2 & tt<3
%        u(1)= inpu(1,3);
%        u(2)= inpu(2,3);
%    elseif tt>=3 & tt<4
%        u(1)= inpu(1,4);
%        u(2)= inpu(2,4);
%    elseif tt>=4 & tt<5
%        u(1)= inpu(1,5);
%        u(2)= inpu(2,5);
%    elseif tt>=5 & tt<6
%        u(1)= inpu(1,6);
%        u(2)= inpu(2,6);
%    elseif tt>=6 & tt<7
%        u(1)= inpu(1,7);
%        u(2)= inpu(2,7);
%    elseif tt>=7 & tt<8
%        u(1)= inpu(1,8);
%        u(2)= inpu(2,8);
%    elseif tt>=8 & tt<9
%        u(1)= inpu(1,9);
%        u(2)= inpu(2,9);
%    elseif tt>=9 & tt<10
%        u(1)= inpu(1,10);
%        u(2)= inpu(2,10);
%    elseif tt>=10 & tt<11
%        u=inpu(11);
%    elseif tt>=11 & tt<12
%        u=  inpu(12);
%    elseif tt>=12 & tt<13
%        u=  inpu(13);
%    elseif tt>=13 & tt<14
%        u= inpu(14);
%    elseif tt>=14 & tt<15
%        u= inpu(15);
%    elseif tt>=15 & tt<16
%        u= inpu(16);
%    elseif tt>=16 & tt<17
%        u=inpu(17);
%    elseif tt>=17 & tt<18
%        u=inpu(18);
%    elseif tt>=18 & tt<19
%        u=inpu(19);
%       elseif tt>=19 & tt<=20
%        u= inpu(20);
% 
% end
