clc;
close all;
clear all;
format short
% ciin = 4;
inputprofile=[];
stateprofile=[];
initialstate=[];
timeprofile=[];
finaltime=10;
initial_state= [1;0.1;40;0;0;1;0;0];
exitflagall=[];
fvalueall=[];
tic
for i=1:10
    if i==6
         ciin = 4;
    else
         ciin = 4;
    end
    save concentration ciin
    save atm  initial_state
    ph=finaltime+1-i;
    i
    %%%%%%%%%%%%%%%%%%% opt 1 starts %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',50000);
    options = optimset(options,'MaxIter',4000);
    options = optimset(options,'TolFun',1e-6);
    options = optimset(options,'TolCon',1e-2);
    options = optimset(options,'TolX',1e-4);
    %options = optimset(options,'Algorithm','interior-point'); %2013b
    %options = optimset(options,'Algorithm','sqp'); %2010a
    options = optimset(options,'Algorithm','active-set'); %2008b
    
    inputguess=[0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1];
    
    optimparam1.optvar = 2;
    optimparam1.objtype = [];
    optimparam1.ncolx =6;
    optimparam1.ncolu =1;
    optimparam1.li = ones(ph,1);
    optimparam1.tf = [];
    optimparam1.ui = [0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1];
    optimparam1.ui=inputguess(1:2,i:end);
    optimparam1.bdx=[0 1000;0,1000;0,1000;0 1000;0,1000;0,1000;0,1000;0,1000];
    optimparam1.par = [];
    optimparam1.bdu = [0 1;0 1];
    optimparam1.bdp =[];
    optimparam1.objfun = @objfun1_case2;
    optimparam1.confun = [];
    optimparam1.process = @process_case2;
    optimparam1.options = options;
    
    [optimout1,optimparam1]= dynopt(optimparam1)
    [tplot1,uplot1,xplot1] = profiles(optimout1,optimparam1,50);
    suminput=trapz(tplot1,uplot1(:,2));
    
    OPT1_J2=ciin*suminput;
    OPT1_J1=optimout1.fval;
  %  OPT1_J1=-3.67;
    
    save functionvalue OPT1_J1
    save  integralu suminput
    
    %%%%%%%%%%%%%%%%%%%    opt 2 starts   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',50000);
    options = optimset(options,'MaxIter',4000);
    options = optimset(options,'TolFun',1e-4);
    options = optimset(options,'TolCon',1e-2);
    options = optimset(options,'TolX',1e-4);
 % options = optimset(options,'Algorithm','interior-point'); %2013b
   options = optimset(options,'Algorithm','sqp'); %2010a
%options = optimset(options,'Algorithm','active-set'); %2008b
    
    optimparam2.optvar = 2;
    optimparam2.objtype = [];
    optimparam2.ncolx =5;
    optimparam2.ncolu =1;
    optimparam2.li = ones(ph,1);
    optimparam2.tf = [];
    %optimparam2.ui =[0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1];
    optimparam2.ui=inputguess(1:2,i:end);
    optimparam2.bdx = [0 1000;0,1000;0,1000;0 1000;0,1000;0,1000;0,1000;0,1000];
    optimparam2.par = [];
    optimparam2.bdu =[0 1;0 1];
    optimparam2.bdp =[];
    optimparam2.objfun = @objfun2_case2;
    optimparam2.confun = @confun_case2;
    optimparam2.process = @process_case2;
    optimparam2.options = options;
    [optimout2,optimparam2]=dynopt(optimparam2)
   
    [tplot2,uplot2,xplot2] = profiles(optimout2,optimparam2,50);
    OPT2_J2=optimout2.fval ;
    OPT2_J1=xplot2(end,1)*xplot2(end,4);
    
    
    fvalueall=[ fvalueall;[-OPT1_J1, OPT2_J1, OPT1_J2, OPT2_J2]]
    exitflagall=[exitflagall;[optimout1.exitflag optimout2.exitflag]]
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    save optimprofiles tplot2 uplot2 xplot2
    
    index=[];
    for j=1:length(tplot2)-1
        if tplot2(j)==tplot2(j+1)
            index=[index,j+1];
        end
    end
    tplot2(index,:)=[];
    xplot2(index,:)=[];
    uplot2(index,:)=[];
    
    initialstate=[initialstate;[initial_state]'];
    initial_state=[interp1(tplot2,xplot2,1)]';
    stateprofile=[stateprofile;[interp1(tplot2,xplot2,[0:.02:1])]];
    timeprofile=[timeprofile;[0:.02:1]'+(i-1)];
    inputprofile=[inputprofile;uplot2(1,:)];
    
    
end
 cputime=toc
save shmpc_lexicographic_data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1)
stairs([0:10],[inputprofile(:,1);inputprofile(end,1)],'b')
ylabel('Glucose feed,u_{1}, L/h')

subplot(2,1,2)
stairs([0:10],[inputprofile(:,2);inputprofile(end,2)],'m')
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
plot(timeprofile,stateprofile(:,2),'k-.')
hold on
plot(timeprofile,stateprofile(:,4),'m-.')
ylabel('States, g/L')
legend('x_{2}','x_{4}');
legend boxoff

subplot(2,2,2)
plot(timeprofile,stateprofile(:,5),'k-.')
hold on
plot(timeprofile,stateprofile(:,6),'m-.')
hold on
plot(timeprofile,stateprofile(:,7),'b-.')
ylabel('States, g/L')
legend('x_{5}','x_{6}','x_{7}');
legend boxoff

subplot(2,2,3)
plot(timeprofile,stateprofile(:,1),'k-.')
xlabel('Time (hour)')
ylabel('Reactor volume, x_{1}, L')
legend boxoff

subplot(2,2,4)
plot(timeprofile,stateprofile(:,3),'k-.')
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
plot(timeprofile, stateprofile(:,2).*stateprofile(:,1),'k-.')
ylabel('Cell mass x_{1}.x_{2}, g')


subplot(2,1,2)
plot(timeprofile, stateprofile(:,4).*stateprofile(:,1),'k-.')
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


