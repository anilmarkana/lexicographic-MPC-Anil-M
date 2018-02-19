function sys = process(t,x,flag,u,p)

switch flag,
    case 0 % f(x,u,p,t)
        sys = [u;x(1)];
    case 1 % df/dx
        sys = [0 1;0 0];
    case 2 % df/du
        sys = [1 0];
    case 3 % df/dp
        sys = [];
    case 4 % df/dt
        sys = [];
    case 5 % x0
        sys = [0;0];
    case 6 % dx0/dp
        sys = [];
    case 7 % M
        sys = [];
    case 8 % unused flag
        sys = [];
    otherwise
        error(['unhandled flag = ',num2str(flag)]); 
end