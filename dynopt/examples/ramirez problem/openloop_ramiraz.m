% this is ramiraz open loop simulation 
clc;
clear all;
close all;

 initial_state= [1;0.1;40;0;0;1;0];
 %u_current=[1,1];
 
 u1=[0.0062 0.0073 .0092 .0144 0.0258 0.0607 0.0299 0.9052 0.4164 0.5448];
u2=[0.0001 0 0 0 0.0002 0.0052 0.0195 0.8614 0.5528 0.5147];
u_current=[u1;u2];

options = odeset('RelTol', 1e-05) ;
[ t, x ] = ode45( @odefun_plant , [0: 10], initial_state', options, u_current ) ;

figure
plot(t,x(:,1),'r')
hold on
plot(t,x(:,2),'g')
hold on 
plot(t,x(:,3)/40,'b')
hold on 
plot(t,x(:,4),'k')
hold on 
plot(t,x(:,5),'m')
hold on 
plot(t,x(:,6),'.r')
hold on 
plot(t,x(:,7),'c')

legend('x1','x2','x3','x4','x5','x6','x7')
grid

