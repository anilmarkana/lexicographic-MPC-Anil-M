clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',3e4);
options = optimset(options,'MaxIter',1000);
options = optimset(options,'TolFun',1e-7);
options = optimset(options,'TolCon',1e-6);
options = optimset(options,'TolX',1e-7);
 options = optimset(options,'Algorithm','interior-point'); %2013b
 %options = optimset(options,'Algorithm','sqp'); %2010a
% options = optimset(options,'Algorithm','active-set'); %2008b
ph=10;
optimparam.optvar = 3; 
optimparam.objtype = []; 
optimparam.ncolx =3;
optimparam.ncolu =1; 
optimparam.li = ones(ph,1);
optimparam.tf = [ph];
optimparam.ui = [zeros(1,ph);zeros(1,ph)]
optimparam.par = []; 
optimparam.bdu = [0 1;0 1]; 
optimparam.bdx = [0 10;0 10;0 50;0 10;0 10;0 10;0 10]; 
optimparam.bdp =[];
optimparam.objfun = @objfun; 
 optimparam.confun = @confun; 


optimparam.process = @process;
optimparam.options = options;

[optimout,optimparam]=dynopt(optimparam)
save optimresults optimout optimparam
[tplot,uplot,xplot] = profiles(optimout,optimparam,10);
save optimprofiles tplot uplot xplot 

graph