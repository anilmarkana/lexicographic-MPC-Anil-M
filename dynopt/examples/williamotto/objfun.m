function [f,Df] = objfun(t,x,u,p,xm)
% OBJFUN - returns user given objective function and its derivatives with
% respect to time t, states x, controls u, and parameters p.
%
% If a Mayer form of this function is used, just t, x, u, and p are the
% input arguments to objfun.


%f = [-x(4)*x(8)-x(5)*x(8)];
%f = [-5554.1*x(4)*x(8)-125.9*x(5)*x(8)];
%f = [-x(4)*x(8)];
f = [-x(5)*x(8)];

Df.t = [];

%Df.x = [0;0;0;-x(8);-x(8);0;0;-x(4)-x(5)];
%Df.x = [0;0;0;-5554.1*x(8);-125.9*x(8);0;0;-5554.1*x(4)-125.9*x(5)];
%Df.x = [0;0;0;-x(8);0;0;0;-x(4)];
Df.x = [0;0;0;0;-x(8);0;0;-x(5)];



Df.u = [];
Df.p = [];
