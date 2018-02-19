function [f,Df] = objfun_gudi(t,x,u,p)

% objective function
%f = -[x(4)*x(5)]/80; % J
f = -[x(4)]; % J


% gradients of the objective function
Df.t = [];    % dJ/dt
%Df.x = [0;0;0;-x(5)/80;-x(4)/80]; % dJ/dx
Df.x = [0;0;0;-1;0]; % dJ/dx
Df.u = [];    % dJ/du
Df.p = [];    % dJ/dp