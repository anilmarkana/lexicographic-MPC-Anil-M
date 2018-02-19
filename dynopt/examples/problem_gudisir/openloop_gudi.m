% this is prob 4  open loop simulation 
clc; clear all ; close all;

 initial_state=  [0.5,30,4.1,0,5];
u1=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0.96 1 1 1 1 1 1 1 1 1 1 0.98  1 1 1 1 1 1 1 .87 .7 ]';
u2=[1.97 1.6 1.93 1.92 1.5 1.1 1.15 .81 .8 1.22 .8 .6 .8 1.25 1.7 1.6 1.25 1.1 .62 .6 .25 .4 .55 .2 .35 .2 .1 .15 .25 .7 .52 .9 .52 .53 .12 .1 .25 .006 .006 .006]';
u_current=[u1 u2];
options = odeset('RelTol', 1e-05) ;
[ t, x ] = ode45( @odefun_gudi , [0: 80], initial_state, options, u_current ) ;

figure
plot(t,x(:,1),'r')
hold on
plot(t,x(:,2),'g')
hold on
plot(t,x(:,3),'b')
hold on
plot(t,x(:,4),'*r')
hold on
plot(t,x(:,5),'k')

legend('x1','x2','x3','x4','x5')
grid

