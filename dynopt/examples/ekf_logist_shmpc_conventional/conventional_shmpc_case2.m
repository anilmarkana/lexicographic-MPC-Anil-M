% this m file that will execute conventional nonlinear MPC in shrinking horizon
% mode with EKF based state estimation.

clc;
close all;
clear all;
format short

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global  no_input  Kt Ts xs_plant xs_model  no_of_measurements  no_input  no_states
global R1_est  R2_est
global  Phi_est  Gamma_est  C_est  D_est
no_input = 2 ;
no_states = 8 ;
no_of_measurements = 4 ;
no_of_controlled_op = 4 ;
Ts=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initial_state= [1;0.1;40;0;0;1;0;0];
xs_plant = [1 0.1 40 0 0 1 0 0];
xs_model = [1 0.1 40 0 0 1 0 0];
%xs_model = [1.2 0.12 41 0.1 0.1 1.1 0.1];
x_estimated=xs_model;
x_true=xs_plant';
Po_est = 20*eye(no_states);
R1_est = 10*eye(no_states);
R2_est = 100*eye(no_of_measurements);
finaltime=10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inputprofile=[];
stateprofile=[];
initialstate=[];
timeprofile=[];
exitflagall=[];
fvalueall=[];
noise=[];
actual_fvalueall=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 tic
for i=1:10
    i
   
    save atm  initial_state
    ph=finaltime+1-i;
    
    %%%%%%%%%%%%%%%%%%% optimization   starts %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    options = optimset('LargeScale','off','Display','iter');
    options = optimset(options,'GradObj','on','GradConstr','on');
    options = optimset(options,'MaxFunEvals',50000);
    options = optimset(options,'MaxIter',4000);
    options = optimset(options,'TolFun',1e-3);
    options = optimset(options,'TolCon',1e-2);
    options = optimset(options,'TolX',1e-3);
    %options = optimset(options,'Algorithm','interior-point'); %2013b
    options = optimset(options,'Algorithm','sqp'); %2010a
   % options = optimset(options,'Algorithm','active-set'); %2008b
    
    
    inputguess=[0 0 0.01 0.02 0.03 0.08 0.1 0.17 0.36 0.97;0 0 0 0 0 0.02 0.03 0.04 0.18 1];
    optimparam1.optvar = 2;
    optimparam1.objtype = [];
    optimparam1.ncolx =6;
    optimparam1.ncolu =1;
    optimparam1.li = ones(ph,1);
    optimparam1.tf = [];
    optimparam1.ui=inputguess(1:2,i:end);
    optimparam1.bdx=[0 1000;0,1000;0,1000;0 1000;0,1000;0,1000;0,1000;0,1000];
    optimparam1.par = [];
    optimparam1.bdu = [0 1;0 1];
    optimparam1.bdp =[];
    optimparam1.objfun = @objfun_case2;
    optimparam1.confun = [];
    optimparam1.process = @process_convmpc;
    optimparam1.options = options;
    
    [optimout1,optimparam1]= dynopt(optimparam1)
    cputime=toc
    [tplot1,uplot1,xplot1] = profiles(optimout1,optimparam1,50);
    
    %%%%%%%%%%%%%%%%%%%%   optimization ends here  %%%%%%%%%%%%%%%%%%%%
    
    index=[];
    for j=1:length(tplot1)-1
        if tplot1(j)==tplot1(j+1)
            index=[index,j+1];
        end
    end
    tplot1(index,:)=[];
    xplot1(index,:)=[];
    uplot1(index,:)=[];
    
    initialstate=[initialstate;[initial_state]'];
   % initial_state=[interp1(tplot1,xplot1,1)]';
    stateprofile=[stateprofile;[interp1(tplot1,xplot1,[0:.02:1])]];
    timeprofile=[timeprofile;[0:.02:1]'+(i-1)];
    inputprofile=[inputprofile;uplot1(1,:)];
    
    J1=xplot1(end,1)* xplot1(end,4);
    J2=xplot1(end,8)*4;
    
    exitflagall=[exitflagall;optimout1.exitflag];
    fvalueall=[fvalueall; optimout1.fval J1 J2];
    
    %%%%%%%%%%%%%%%%% optimal input from optimization %%%%%%%%%%%%%%%%%%%%%
    u_current=uplot1(1,:)
    %%%%%%%%%%%%%%%%%% optimal input given to planr odes %%%%%%%%%%%%%%%%%%
    options = odeset('RelTol', 1e-07) ;
    [ t, x ] = ode45( @odefun_logist , [0 Ts], xs_plant, options, u_current  ) ;
    xs_p = x(end, :)' ;
    
    %%%%%%%% measurement noise added to the plant measurements %%%%%%%%%%%%
%         noise1=(0.01*randn(1));
%         noise2=(0.01*randn(1));
%         noise3=(0.001*randn(1));
%         noise4=(0.001*randn(1));
%         noise=[noise; noise1 noise2 noise3 noise4 ]
    %     save noiseadded noise
   load noiseadded
    
   % y_plant = [xs_p(1)+noise1;xs_p(3)+noise2;xs_p(4)+noise3;xs_p(5)+noise4] ;
   y_plant = [xs_p(1)+noise(i,1);xs_p(3)+noise(i,2);xs_p(4)+noise(i,3);xs_p(5)+noise(i,4)] ;
    y_plant(y_plant<0)=0;
    
    
    actual_J1=y_plant(1,1)* y_plant(3,1);
    ciin=4;
    actual_J2=xs_p(8,1)*ciin;
    actual_fvalueall=[actual_fvalueall; actual_J1 actual_J2];
    
    
    %%%%%%%%%% Estimation by kalman filter starts  %%%%%%%%
    Kt=i;
    [X_est, Po_est] = kalman_main(y_plant, xs_model, u_current, Po_est, Kt);
    
    
    xs_plant =xs_p';
    xs_model = X_est' ;
    
   initial_state= X_est;
    
end
 cputime=toc

save shmpc_conventionalmpc_data
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


