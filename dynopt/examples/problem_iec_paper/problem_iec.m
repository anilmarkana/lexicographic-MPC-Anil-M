clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',5000);
options = optimset(options,'MaxIter',200);
options = optimset(options,'TolFun',1e-7);
options = optimset(options,'TolCon',1e-6);
options = optimset(options,'TolX',1e-7);
%  options = optimset(options,'Algorithm','interior-point'); %2013b
options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b

optimparam.optvar = 2; 
optimparam.objtype = []; 
optimparam.ncolx = 3;
optimparam.ncolu =1; 
optimparam.li = ones(5,1)*10;
%optimparam.li = ones(10,1)*5;
optimparam.tf = [];
optimparam.ui = [ones(1,5);ones(1,5)]*50;
optimparam.par = []; 
optimparam.bdu = [0 100;0 100]; 
% optimparam.bdx=[];
 optimparam.bdx = [0,250;0, 250;0, 50;0, 200;0, 200;0, 10000]; 
optimparam.bdp =[];
optimparam.objfun = @objfun; 
 optimparam.confun = @confun; 


optimparam.process = @process;
optimparam.options = options;

[optimout,optimparam]=dynopt(optimparam)
save optimresults optimout optimparam
[tplot,uplot,xplot] = profiles(optimout,optimparam,50);
save optimprofiles tplot uplot xplot 

graph