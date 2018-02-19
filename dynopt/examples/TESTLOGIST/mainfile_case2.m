% this m file will execute conventional nonlinear MPC in shrinking horizon
% mode.

clc;
close all;
clear all;
format short
inputprofile=[];
stateprofile=[];
initialstate=[];
timeprofile=[];
finaltime=10;
initial_state= [1;0.1;40;0;0;1;0;0];
exitflagall=[];
fvalueall=[];



options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',50000);
options = optimset(options,'MaxIter',4000);
options = optimset(options,'TolFun',1e-3);
options = optimset(options,'TolCon',1e-2);
options = optimset(options,'TolX',1e-3);
 options = optimset(options,'Algorithm','interior-point'); %2013b
%options = optimset(options,'Algorithm','sqp'); %2010a
% options = optimset(options,'Algorithm','active-set'); %2008b

optimparam1.optvar = 2;
optimparam1.objtype = [];
optimparam1.ncolx =6;
optimparam1.ncolu =1;
optimparam1.li = ones(10,1);
optimparam1.tf = [];
optimparam1.ui = [0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1];
optimparam1.bdx=[0 1000;0,1000;0,1000;0 1000;0,1000;0,1000;0,1000;0,1000];
optimparam1.par = [];
optimparam1.bdu = [0 1;0 1];
optimparam1.bdp =[];
optimparam1.objfun = @objfun_case2;
optimparam1.confun = @confun_case2;
optimparam1.process = @process_case2;
optimparam1.options = options;

[optimout1,optimparam1]= dynopt(optimparam1)

[tplot01,uplot01,xplot01] = profiles(optimout1,optimparam1,50);


index=[];
for j=1:length(tplot01)-1
    if tplot01(j)==tplot01(j+1)
        index=[index,j+1];
    end
end
tplot01(index,:)=[];
xplot01(index,:)=[];
uplot01(index,:)=[];


J1=xplot01(end,1)* xplot01(end,4);
J2=xplot01(end,8)*4;

exitflagall=[exitflagall;optimout1.exitflag];
fvalueall=[fvalueall; optimout1.fval J1 J2]




%save openloop_data01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot(tplot01,xplot01)


