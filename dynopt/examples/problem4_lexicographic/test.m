clc;
close all;
clear all;
format short
inputprofile=[];
stateprofile=[];
finaltime=4;
initial_state= [1;0];
exitflagall=[];
fvalueall_opt1=[];
fvalueall_opt2=[];

for i=1:4
    save atm  initial_state
    ph=finaltime+1-i;
    i
    
    %%%%%%%%%%%%%%%%%%% opt 1 starts %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',1e5);
    options = optimset(options,'MaxIter',1e5);
    options = optimset(options,'TolFun',1e-7);
    options = optimset(options,'TolCon',1e-7);
    options = optimset(options,'TolX',1e-7);
    options = optimset(options,'Algorithm','sqp'); %2010a
    %options = optimset(options,'Algorithm','interior-point'); %2013b
        
    optimparam1.optvar = 2;
    optimparam1.objtype = [];
    optimparam1.ncolx =6;
    optimparam1.ncolu =2;
    optimparam1.li = ones(ph,1)*(1/4);
    optimparam1.tf = [];
    optimparam1.ui = ones(1,ph)*2.5;
    optimparam1.bdx = [];
    optimparam1.par = [];
    optimparam1.bdu = [0 5];
    optimparam1.bdp =[];
    optimparam1.objfun = @objfunone;    
    optimparam1.confun = [];
    optimparam1.process = @lexico_process;
    optimparam1.options = dynopt(optimparam1)
    [tplot1,uplot1,xplot1] = profiles(optimout1,optimparam1,50);
    suminput=trapz(tplot1,uplot1);
    fvalueone=optimout1.fval; 
   
    
    save functionvalue fvalueone  
    save  integralu suminput 
    
    %%%%%%%%%%%%%%%%%%% opt 2 starts %%%%%%%%%%%%%%%%%%%%%%%%%%
    
     options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',1e5);
    options = optimset(options,'MaxIter',1e5);
    options = optimset(options,'TolFun',1e-7);
    options = optimset(options,'TolCon',1e-7);
    options = optimset(options,'TolX',1e-7);
    options = optimset(options,'Algorithm','sqp'); %2010a
    %options = optimset(options,'Algorithm','interior-point'); %2013b
        
    optimparam2.optvar = 2;
    optimparam2.objtype = [];
    optimparam2.ncolx =6;
    
    optimparam2.ncolu =2;
    optimparam2.li = ones(ph,1)*(1/4);
    optimparam2.tf = [];
    optimparam2.ui = ones(1,ph)*2.5;
    optimparam2.bdx = [];
    optimparam2.par = [];
    optimparam2.bdu = [0 5];
    optimparam2.bdp =[];
    optimparam2.objfun = @objfuntwo;
    optimparam2.confun = @confuntwo;
    optimparam2.process = @lexico_process;
    optimparam2.options = options;
        
    [optimout2,optimparam2]=dynopt(optimparam2)
    fvaluetwo=optimout2.fval ;  
    fvalueall=[ fvalueall;[fvalueone fvaluetwo]];
     exitflagall=[exitflagall;[optimout1.exitflag optimout2.exitflag]];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
    [tplot2,uplot2,xplot2] = profiles(optimout2,optimparam2,50);
    save optimprofiles tplot2 uplot2 xplot2 
    
    index=[];
    for j=1:length(tplot2)-1
        if tplot2(j)==tplot2(j+1)
            index=[index,j+1];
        end
    end
    tplot2(index,:)=[];
    xplot2(index,:)=[];
    
    stateprofile=[stateprofile;[initial_state]'];
    initial_state=[interp1(tplot2,xplot2,0.25)]';
    inputprofile=[inputprofile;uplot2(1,:)];
    
    
end