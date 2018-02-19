function sys = process(t,x,flag,u,p)
%%%%%%%%%%%%%%%%% parameter defining%%%%%%%%%%%%%%%%%
 qOcap=0.3;
ki=10.00;
qSmax=2.4;
Ks=0.12;
qm=0.01;
Ke=0.1;
Cx=0.0384;
Cs=0.0333;
Ce=0.0435;
Yxsox=0.50;
Yxsf=0.15;
Yxe=0.72;
Yos=1.067;
Yoe=2.087;
Yes=0.51;
F0=0.08;
SFR=0.25;
Fmax=0.21;
Si=100.00;
KLa=600.00;
Ko=1.0;
tL=0.75;


switch flag,
    case 0 % f(x,u,p,t)
       

qOmax=qOcap/(1.00+x(5)/ki)*x(4)/(x(4)+Ko);
qS=qSmax*x(2)/(x(2)+Ks)*(1.00-exp(-t/tL));
qSox=qS;
qSoxan=(qSox-qm)*Yxsox*Cx/Cs;
qSoxen=qSox-qSoxan;
qOs=qSoxen*Yos;
red=1.00;

if qOs > qOmax
    red=qOmax/qOs;
    qOs=qOmax;
end
qSoxen=red*qSoxen;
qSoxan=red*qSoxan;
qSox=qSoxen+qSoxan;
qSf=qS-qSox;
qSfan=qSf*Yxsf*Cx/Cs;
qSfen=qSf-qSfan;
qEp=qSfen*Yes;
qEen=(qOmax-qOs)/Yoe*x(5)/(x(5)+Ke);
qEc=qEen/(1-Yxe*Cx/Ce);
qO=qOs+qEen*Yoe;
mue=(qSox-qm)*Yxsox+qSf*Yxsf+qEc*Yxe;
        sys = [x(1)*(mue-u/x(3));u/x(3)*(Si-x(2))-x(1)*qS;u;KLa*(100-x(4))-14000.00*x(1)*qO;x(1)*(qEp-qEc)-u/x(3)*x(5)];
    case 1 % df/dx
       

qOmax=qOcap/(1.00+x(5)/ki)*x(4)/(x(4)+Ko);
qS=qSmax*x(2)/(x(2)+Ks)*(1.00-exp(-t/tL));
qSox=qS;
qSoxan=(qSox-qm)*Yxsox*Cx/Cs;
qSoxen=qSox-qSoxan;
qOs=qSoxen*Yos;
red=1.00;

if qOs > qOmax
    red=qOmax/qOs;
    qOs=qOmax;
end
qSoxen=red*qSoxen;
qSoxan=red*qSoxan;
qSox=qSoxen+qSoxan;
qSf=qS-qSox;
qSfan=qSf*Yxsf*Cx/Cs;
qSfen=qSf-qSfan;
qEp=qSfen*Yes;
qEen=(qOmax-qOs)/Yoe*x(5)/(x(5)+Ke);
qEc=qEen/(1-Yxe*Cx/Ce);
qO=qOs+qEen*Yoe;
mue=(qSox-qm)*Yxsox+qSf*Yxsf+qEc*Yxe;
        sys = [mue-u/x(3),-qS,0,-14000*qO,qEp-qEc;0,-u/x(3),0,0,0;u*x(1)/(x(3)*x(3)),-u(Si-x(2))/(x(3)*x(3)),0,0,u*x(5)/(x(3)*x(3));0,0,0,-KLa,0;0,0,0,0,-u/x(3)];
    case 2 % df/du
        sys = [-x(1)/x(3),(Si-x(2))/x(3),1,0,-x(5)/x(3)];
    case 3 % df/dp
        sys = [];
    case 4 % df/dt
        sys = [];
    case 5 % x0
        sys = [0.2;100.0;1.00;100.0;0.0];
    case 6 % dx0/dp
        sys = [];
    case 7 % M
        sys = [];
    case 8 % unused flag
        sys = [];
    otherwise
        error(['unhandled flag = ',num2str(flag)]); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




