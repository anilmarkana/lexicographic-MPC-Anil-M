function [f,Df] = objfun2_case2(t,x,u,p,xm)
% OBJFUN - returns user given objective function and its derivatives with
% respect to time t, states x, controls u, and parameters p.
%
% If a Mayer form of this function is used, just t, x, u, and p are the
% input arguments to objfun.

ciin = 4;
f = [ciin*x(8)];

Df.t = [];
Df.x = [0;0;0;0;0;0;0;ciin];
Df.u = [];
Df.p = [];
