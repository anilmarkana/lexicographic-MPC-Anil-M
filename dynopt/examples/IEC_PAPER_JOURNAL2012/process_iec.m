
function sys = process_iec(t,x,flag,u,p)

switch flag,
    case 0 % f(x,u,p,t)
 Cfa=30;
Cfb=20;
k1=1;
k1desh=2;
k2=2;
k2desh=0.2;
k3=1.5;
k3desh=0.3;

 sys = [u(1)*Cfa/x(6)-k1*x(1)*x(2)+k1desh*x(3)-k2*x(1)*x(3)+k2desh*x(4) ;u(2)*Cfb/x(6)-k1*x(1)*x(2)+k1desh*x(3)-k3*x(2)*x(3)+k3desh*x(5) ;k1*x(1)*x(2)-k1desh*x(3)-k2*x(1)*x(3)+k2desh*x(4)-k3*x(2)*x(3)+k3desh*x(5) ;k2*x(1)*x(3)-k2desh*x(4);k3*x(2)*x(3)-k3desh*x(5);u(1)+u(2)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    case 1 % df/dx
 Cfa=30;
Cfb=20;
k1=1;
k1desh=2;
k2=2;
k2desh=0.2;
k3=1.5;
k3desh=0.3;

f1x1 = - k1*x(2) - k2*x(3);
f2x1 = -k1*x(2);
f3x1 = k1*x(2) - k2*x(3);
f4x1 = k2*x(3);
f5x1 = 0;
f6x1 = 0;

f1x2 = -k1*x(1);
f2x2 = -k1*x(1) - k3*x(3);
f3x2 = k1*x(1) - k3*x(3);
f4x2 = 0;
f5x2 = k3*x(3);
f6x2 = 0;

f1x3 = k1desh - k2*x(1);
f2x3 = k1desh - k3*x(2);
f3x3 = -k1desh - k2*x(1) - k3*x(2);
f4x3 = k2*x(1);
f5x3 = k3*x(2);
f6x3 = 0;

f1x4 = k2desh;
f2x4 = 0;
f3x4 = k2desh;
f4x4 = -k2desh;
f5x4 = 0;
f6x4 = 0;

f1x5 = 0;
f2x5 = k3desh;
f3x5 = k3desh;
f4x5 = 0;
f5x5 = -k3desh;
f6x5 = 0;

f1x6 = -(Cfa*u(1))/x(6)^2;
f2x6 = -(Cfb*u(2))/x(6)^2;
f3x6 = 0;
f4x6 = 0;
f5x6 = 0;
f6x6 = 0;

sys = [f1x1 f2x1 f3x1 f4x1 f5x1 f6x1;
       f1x2 f2x2 f3x2 f4x2 f5x2 f6x2;
       f1x3 f2x3 f3x3 f4x3 f5x3 f6x3;
       f1x4 f2x4 f3x4 f4x4 f5x4 f6x4;
       f1x5 f2x5 f3x5 f4x5 f5x5 f6x5;
       f1x6 f2x6 f3x6 f4x6 f5x6 f6x6];



       % sys = [-k1*x(2)-k2*x(3),-k1*x(2),k1*x(2)-k2*x(3),k2*x(3),0,0;-k1*x(1),-k1*x(1)-k3*x(3),k1*x(1)-k3*x(3),0,k3*x(3),0;k1desh-k2*x(1),k1desh-k3*x(2),-k1desh-k2*x(1)-k3*x(2),k2*x(1),k3*x(2),0;k2desh,0,k2desh,-k2desh,0,0;0,k3desh,k3desh,0,-k3desh,0;-u(1)*Cfa/(x(6)*x(6)),-u(2)*Cfb/(x(6)*x(6)),0,0,0,0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    case 2 % df/du
 Cfa=30;
Cfb=20;
k1=1;
k1desh=2;
k2=2;
k2desh=0.2;
k3=1.5;
k3desh=0.3;

f1u1 = Cfa/x(6);
f2u1 = 0;
f3u1 = 0;
f4u1 = 0;
f5u1 = 0;
f6u1 = 1;

f1u2 = 0;
f2u2 = Cfb/x(6);
f3u2 = 0;
f4u2 = 0;
f5u2 = 0;
f6u2 = 1;

sys = [f1u1 f2u1 f3u1 f4u1 f5u1 f6u1;
        f1u2 f2u2 f3u2 f4u2 f5u2 f6u2]; 

        %sys = [Cfa/x(6),0,0,0,0,1;0,Cfb/x(6),0,0,0,1];
    case 3 % df/dp
        sys = [];
    case 4 % df/dt
        sys = [];
    case 5 % x0
        sys = [100;150; 0; 0; 0; 100];
    case 6 % dx0/dp
        sys = [];
    case 7 % M
        sys = [];
    case 8 % unused flag
        sys = [];
    otherwise
        error(['unhandled flag = ',num2str(flag)]); 
end