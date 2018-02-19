clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',15000);
options = optimset(options,'MaxIter',3000);
options = optimset(options,'TolFun',1e-7);
options = optimset(options,'TolCon',1e-6);
options = optimset(options,'TolX',1e-7);
 options = optimset(options,'Algorithm','interior-point'); %2013b
%options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b

optimparam.optvar = 3; 
optimparam.objtype = []; 
optimparam.ncolx = 5;
optimparam.ncolu =1; 
optimparam.li = ones(5,1)*200;
%optimparam.li = ones(10,1)*5;
optimparam.tf = [1000];
optimparam.ui = [ones(1,5)*5;ones(1,5)]*0.05;
optimparam.par = []; 
optimparam.bdu = [0 5.784;0.02 0.1]; 
 %optimparam.bdx=[];
 optimparam.bdx = [0,1;0,1;0,1;0,1;0,1;0,1;60,90;2,5]; 
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