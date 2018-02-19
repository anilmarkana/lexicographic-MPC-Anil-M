clc;
close all;
clear all;
options = optimset('LargeScale','off','Display','iter');
options = optimset(options,'GradObj','on','GradConstr','on');
options = optimset(options,'MaxFunEvals',10000);
options = optimset(options,'MaxIter',500);
options = optimset(options,'TolFun',1e-4);
options = optimset(options,'TolCon',1e-2);
options = optimset(options,'TolX',1e-3);
%options = optimset(options,'Algorithm','interior-point'); %2013b
 options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b

optimparam.optvar = 2;
optimparam.objtype = [];
optimparam.ncolx = 6;
optimparam.ncolu =1;
optimparam.li = ones(10,1);
optimparam.tf =[];
%optimparam.ui = [ones(1,10)*5;ones(1,10)]*0.05;
%optimparam.ui= rand(2,10);
optimparam.ui=[0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1]
optimparam.par = [];
optimparam.bdu = [0 1;0 1];
optimparam.bdx=[0 1000;0,1000;0,1000;0 1000;0,1000;0,1000;0,1000;0,1000];
optimparam.bdp =[];
optimparam.objfun = @objfun_case2;

%optimparam.confun = @confun_case2;
optimparam.confun =[];
optimparam.process = @process_case2;
optimparam.options = options;

[optimout,optimparam]=dynopt(optimparam)
save optimresults optimout optimparam
[tplot,uplot,xplot] = profiles(optimout,optimparam,50);
save optimprofiles tplot uplot xplot

J1=xplot(end,1)* xplot(end,4)
J2= xplot(end,8)*4
optimout.exitflag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save shmpc_lexicographic_data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1)
plot(tplot,uplot(:,1),'b')
ylabel('Glucose feed,u_{1}, L/h')

subplot(2,1,2)
plot(tplot,uplot(:,2),'b')
ylabel('Inducer feed,u_{2} L/h')
xlabel('Time (hour)')

a=findobj(gcf); % 

allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
subplot(2,2,1)
plot(tplot,xplot(:,2),'k-.')
hold on
plot(tplot,xplot(:,4),'m-.')
ylabel('States, g/L')
legend('x_{2}','x_{4}');
legend boxoff

subplot(2,2,2)
plot(tplot,xplot(:,5),'k-.')
hold on
plot(tplot,xplot(:,6),'m-.')
hold on
plot(tplot,xplot(:,7),'b-.')
ylabel('States, g/L')
legend('x_{5}','x_{6}','x_{7}');
legend boxoff

subplot(2,2,3)
plot(tplot,xplot(:,1),'k-.')
xlabel('Time (hour)')
ylabel('Reactor volume, x_{1}, L')
legend boxoff

subplot(2,2,4)
plot(tplot,xplot(:,3),'k-.')
xlabel('Time (hour)')
ylabel('Nutrient Conc. x_{3}, g/L')
legend boxoff

a=findobj(gcf); % 
allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1)
plot(tplot, xplot(:,2).*xplot(:,1),'k-.')
ylabel('Cell mass x_{1}.x_{2}, g')


subplot(2,1,2)
plot(tplot, xplot(:,4).*xplot(:,1),'k-.')
ylabel('Foreign protein mass x_{1}.x_{4}, g')
xlabel('Time (hour)')
a=findobj(gcf); %
allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);




%graph