function [f,Df] = objfun_case2(t,x,u,p,xm)
% OBJFUN - returns user given objective function and its derivatives with
% respect to time t, states x, controls u, and parameters p.
%
% If a Mayer form of this function is used, just t, x, u, and p are the
% input arguments to objfun.
load('concentration.mat')
%ciin = 4;
w1=1;
w2=1;
%f = [-x(1)*x(4)];
f = [-w1*x(1)*x(4)+w2*ciin*x(8)];

Df.t = [];
%Df.x = [-x(4);0;0;-x(1);0;0;0];
Df.x = [-w1*x(4);0;0;-w1*x(1);0;0;0;ciin*w2];
Df.u = [];
Df.p = [];
