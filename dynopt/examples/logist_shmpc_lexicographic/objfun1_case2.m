function [f,Df] = objfun1_case2(t,x,u,p,xm)
% OBJFUN - returns user given objective function and its derivatives with
% respect to time t, states x, controls u, and parameters p.
%
% If a Mayer form of this function is used, just t, x, u, and p are the
% input arguments to objfun.



f = [-x(1)*x(4)];

Df.t = [];
Df.x = [-x(4);0;0;-x(1);0;0;0;0];
Df.u = [];
Df.p = [];
