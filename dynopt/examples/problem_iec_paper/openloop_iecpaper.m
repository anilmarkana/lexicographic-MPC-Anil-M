% this is prob 4  open loop simulation 
clc; clear all ; close all;

 initial_state=  [100,150, 0,0, 0,100];

u_current=[100 100];
options = odeset('RelTol', 1e-05) ;
[ t, x ] = ode45( @odefun_iecpaper , [0: 10], initial_state, options, u_current ) ;

figure
plot(t,x(:,1),'r')
hold on
plot(t,x(:,2),'g')
hold on
plot(t,x(:,3),'b')
hold on
plot(t,x(:,4),'y')
hold on
plot(t,x(:,5),'k')
% hold on
% plot(t,x(:,6),'m')
% 
legend('x1','x2','x3','x4','x5')
grid

