% this is prob 4  open loop simulation 
clc; clear all ; close all;

 initial_state= [1, 0];

u_current=[0.8355,1.0442, 1.4591, 2.8621];
options = odeset('RelTol', 1e-05) ;
[ t, x ] = ode45( @odefun_prob4 , [0: 1], initial_state, options, u_current ) ;

figure
plot(t,x(:,1),'r')
hold on
plot(t,x(:,2),'g')

legend('x1','x2')
grid

