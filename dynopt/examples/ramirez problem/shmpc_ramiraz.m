clc;
close all;
clear all;
format short
inputprofile=[];
stateprofile=[];
finaltime=10;
 initial_state= [1;0.1;40;0;0;1;0];

for i=1:10
    save atm  initial_state
    ph=finaltime+1-i;    
    
    options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',2e4);
    options = optimset(options,'MaxIter',2000);
    options = optimset(options,'TolFun',1e-7);
    options = optimset(options,'TolCon',1e-6);
    options = optimset(options,'TolX',1e-7);
    options = optimset(options,'Algorithm','interior-point'); %2013b
    %options = optimset(options,'Algorithm','sqp'); %2010a
    % options = optimset(options,'Algorithm','active-set'); %2008b
    
    optimparam.optvar = 3;
    optimparam.objtype = [];
    optimparam.ncolx =2;
    optimparam.ncolu =1;
    %optimparam.li = ones(10,1);
    optimparam.li = ones(ph,1);
    
         
    optimparam.tf = [ph];

    optimparam.ui = [zeros(1,ph);zeros(1,ph)];
    optimparam.bdx = [0 10;0 10;0 50;0 10;0 10;0 10;0 10];
    
    
    optimparam.par = [];
    optimparam.bdu = [0 1;0 1];
    optimparam.bdp =[];
    optimparam.objfun = @objfun;
    optimparam.confun = @confun;
    
    
    optimparam.process = @process_shmpc;
    optimparam.options = options;
    
    [optimout,optimparam]=dynopt(optimparam)
    save optimresults optimout optimparam
    [tplot,uplot,xplot] = profiles(optimout,optimparam,10);
    save optimprofiles tplot uplot xplot
    %graph

    index=[];
    for j=1:length(tplot)-1
        if tplot(j)==tplot(j+1)
        index=[index,j+1];
        end
    end
 
tplot(index,:)=[];
xplot(index,:)=[];   
    
    
    
    stateprofile=[stateprofile;[initial_state]'];
    initial_state=[interp1(tplot,xplot,1)]'
    
    inputprofile=[inputprofile;uplot(1,:)];
    
    save anilresults
    
end