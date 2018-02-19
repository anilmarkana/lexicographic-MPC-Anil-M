function [c,ceq,Dc,Dceq] = confun(t,x,flag,u,p)

switch flag
    case 0 % constraints in t0
        c = [];
        ceq = [];
        
        % gradient calculus
        if nargout == 4
            Dc.t = [];
            Dc.x = [];
            Dc.u = [];
            Dc.p = [];
            Dceq.t = [];
            Dceq.x = [];
            Dceq.u = [];
            Dceq.p = [];
        end
    case 1 % constraints over interval [t0,tf]
        c = -[x(1);x(2);x(3);x(4);x(5);x(6)];
      %c=[];
        ceq = [];
        
        % gradient calculus
        if nargout == 4
            Dc.t = [];
            Dc.x = [-1 0 0 0 0 0;0 -1 0 0 0 0;0 0 -1 0 0 0;0 0 0 -1 0 0;0 0 0 0 -1 0;0 0 0 0 0 -1];
            %Dc.x=[];
            Dc.u = [];
            Dc.p = [];
            Dceq.t = [];
            Dceq.x = [];
            Dceq.u = [];
            Dceq.p = [];
        end
    case 2 % constraints in tf
        c = [x(6)-10000];
        ceq = [];
        
        % gradient calculus   
        if nargout == 4
            Dc.t = [];
            Dc.x = [0;0;0;0;0;1];
            Dc.u = [];
            Dc.p = [];
            Dceq.t = [];
            Dceq.x = [];
            Dceq.u = [];
            Dceq.p = [];
        end
 end