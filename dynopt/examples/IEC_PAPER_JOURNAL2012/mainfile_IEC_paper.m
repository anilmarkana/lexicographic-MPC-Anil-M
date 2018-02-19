clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',5000);
options = optimset(options,'MaxIter',200);
options = optimset(options,'TolFun',1e-3);
options = optimset(options,'TolCon',1e-1);
options = optimset(options,'TolX',1e-2);
 options = optimset(options,'Algorithm','interior-point'); %2013b
% options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b

optimparam.optvar = 2; 
optimparam.objtype = []; 
optimparam.ncolx = 2;
optimparam.ncolu =1; 
%optimparam.li = ones(5,1)*10;
optimparam.li = ones(10,1)*5;
optimparam.tf = [];
optimparam.ui = [0,100,100,100,100,100,100,100,100,100;0,60,100,100,100,100,100,100,100,100];
optimparam.par = []; 
optimparam.bdu = [0 100;0 100]; 
 optimparam.bdx=[];
% optimparam.bdx = [38,250;50, 250;1, 50;5, 200;0.1, 200;0.1, 10000]; 
optimparam.bdp =[];
optimparam.objfun = @objfun_iec; 
 optimparam.confun = @confun_iec; 


optimparam.process = @process_iec;
optimparam.options = options;

[optimout,optimparam]=dynopt(optimparam)
save optimresults optimout optimparam
[tplot,uplot,xplot] = profiles(optimout,optimparam,50);
save optimprofiles tplot uplot xplot 

graph