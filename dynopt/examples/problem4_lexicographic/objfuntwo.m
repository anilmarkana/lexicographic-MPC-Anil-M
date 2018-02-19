function [f,Df] = objfuntwo(t,x,u,p)

 load('integralu.mat')
 
% objective function
f = [-x(2)]/suminput; % J

% gradients of the objective function
Df.t = [];      % dJ/dt
Df.x = [0;-1/suminput];  % dJ/dx
Df.u = [];      % dJ/du
Df.p = [];      % dJ/dp