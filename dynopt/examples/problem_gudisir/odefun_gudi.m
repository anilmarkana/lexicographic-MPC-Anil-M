function x_dot = odefun_gudi(tt, x, u_current)

 for i=0:39
     
     if tt>=2*i & tt<2*(i+1)
       u(1)= u_current(i+1,1);
       u(2)= u_current(i+1,2);
     else
         u(1)= u_current(end,1);
         u(2)= u_current(end,2);
         
     end
     
 end
%  plot(tt,u(1),'*',tt,u(2) )
%  hold on


a = 6.9;
k = 0.02;
km = 95.6;
ks = 6.65;
ki = 104.5;
alpha = 9.2;
muem = 0.25;
b = 0.023;
n = 0.4;
kg = 33.0;
kl = 0.0037;
vmo = 68;
beta = 0.073;
sf = 200;
gf = 0.15*sf;

mue = muem*exp(-kl*x(4))*(x(3)/(ks+x(3)+x(3)*x(3)/ki));
rg = vmo*exp(-k*x(4)^n)*(x(2)/(km*(1+x(3)/kg)+x(2)));
        
x_dot1= -(u(1)+u(2)/x(5))*x(1) + mue*x(1);
x_dot2= u(2)*sf/x(5) -((u(1)+u(2))/x(5))*x(2) - rg/1.11;
x_dot3= u(1)*gf/x(5) -((u(1)+u(2))/x(5))*x(3) + (rg-(a*mue*x(1)+b*x(1)));
x_dot4= -((u(1)+u(2))/x(5))*x(4) + (alpha*mue*x(1)+beta*x(1));
x_dot5= u(1)+u(2);

        
 x_dot = [x_dot1;x_dot2;x_dot3;x_dot4;x_dot5];



 
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
