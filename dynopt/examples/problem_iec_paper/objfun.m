function [f,Df] = objfun(t,x,u,p)

% objective function
f = -[x(4)+x(5)]; % J


% gradients of the objective function
Df.t = [];    % dJ/dt
Df.x = [0;0;0;-1;-1;0]; % dJ/dx
Df.u = [];    % dJ/du
Df.p = [];    % dJ/dp