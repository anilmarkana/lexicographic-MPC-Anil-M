function x_dot = odefun_prob4(tt, x, inpu)

%%%%
tt
inpu
if tt>=0 & tt<0.25
    u= inpu(1,1);
elseif tt>=0.25 & tt<0.5
    u= inpu(1,2);
    
elseif tt>=0.5 & tt<0.75
    u= inpu(1,3);
    
elseif tt>=0.75 & tt<=1
    u= inpu(1,4);
  
end
%%%%

 
x_dot(1,1)=(-u-0.5*u*u)*x(1);
x_dot(2,1)=u*x(1);

 
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
