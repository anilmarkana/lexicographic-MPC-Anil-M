clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',10000);
options = optimset(options,'MaxIter',1500);
options = optimset(options,'TolFun',1e-8);
options = optimset(options,'TolCon',1e-7);
options = optimset(options,'TolX',1e-8);
options = optimset(options,'Algorithm','interior-point'); %2013b
%options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b

optimparam.optvar =2;
optimparam.objtype = [];
optimparam.ncolx =8;
optimparam.ncolu =1;
optimparam.li = ones(20,1)*4;
optimparam.tf = [];
optimparam.ui = [ones(1,20)*1;ones(1,20)*2];
optimparam.par = [];
optimparam.bdu =[0,1;0,2];
optimparam.bdx = [];
optimparam.bdp =[];
optimparam.objfun = @objfun_gudi;
optimparam.confun = @confun_gudi;
optimparam.process = @process_gudi;
optimparam.options =options;

[optimout,optimparam]=dynopt(optimparam)
[tplot,uplot,xplot] = profiles(optimout,optimparam,50);
save optimprofiles tplot uplot xplot
save optimresults optimout optimparam

graph