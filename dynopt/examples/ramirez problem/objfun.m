function [f,Df] = objfun(t,x,u,p)

% objective function
f = -[x(4)*x(1)]; % J

% gradients of the objective function
Df.t = [];    % dJ/dt
Df.x = [-x(4);0;0;-x(1);0;0;0]; % dJ/dx
Df.u = [];    % dJ/du
Df.p = [];    % dJ/dp