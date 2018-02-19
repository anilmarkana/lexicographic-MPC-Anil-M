function [sys,x0,str,ts] = linear2(t,x,u,flag)

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes(t,x,u);

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end
% end csfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes(t,x,u)

sizes = simsizes;
sizes.NumContStates  = 8;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;

sys = simsizes(sizes);
x0  = zeros(8,1);
str = [];
ts  = [0 0];

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(t,x,u)

ciin = 4;
csin = 100;
mue = (x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*(x(6) + x(7)*0.22/(0.22+x(5)));
pii = (0.233*x(3)/(14.35+x(3)+x(3)*x(3)/111.5))*((0.0005 + x(5))/(0.022 + x(5)));
k1 = 0.085*x(5)/(0.034+x(5));
k2 = 0.085*x(5)/(0.034+x(5));

sys=[ u(1) + u(2);
     mue*x(2) - (u(1) + u(2))*x(2)/x(1);
     csin*u(1)/x(1) - (u(1) + u(2))*x(3)/x(1) - mue*x(2)/0.51;
      pii*x(2) - (u(1) + u(2))*x(4)/x(1);
       ciin*u(2)/x(1) - (u(1) + u(2))*x(5)/x(1);
       -x(6)*k1;
        k2*(1- x(7));
        u(2)
        ] ;

 
% end mdlDerivatives
%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(3);
sys(3)=x(4);
sys(4)=x(5);

% end mdlOutputs
