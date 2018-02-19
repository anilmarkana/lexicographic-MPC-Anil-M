% this is kalman filter  simulation for logist paper
clc; clear all ; close all;

global  no_input  Kt Ts xs_plant xs_model  no_of_measurements  no_input  no_states

global R1_est  R2_est
global  Phi_est  Gamma_est  C_est  D_est

no_input = 2 ;
no_states = 7 ;
no_of_measurements = 4 ;
no_of_controlled_op = 4 ;
Ts=1;

%%%%%%%%%%%%%%%% initial conditions %%%%%%%%%%%%%%%%%%%

u_current=[0.2 0.2];
xs_plant = [1 0.1 40 0 0 1 0];
%xs_model = [1 0.1 40 0 0 1 0];
xs_model = [1.2 0.12 41 0.1 0.1 1.1 0.1];
x_estimated=xs_model;
x_true=xs_plant';


Po_est = 20*eye(no_states);
R1_est = 10*eye(no_states);
R2_est = 100*eye(no_of_measurements);



for Kt = 1 :10
    Kt ;
    %%%%%%%%%% plant simulation starts %%%%%%%%%%%%%%%
    
    options = odeset('RelTol', 1e-07) ;
    [ t, x ] = ode45( @odefun_logist , [0 Ts], xs_plant, options, u_current  ) ;
    xs_p = x(end, :)' ;
    y_plant = [xs_p(1)+0.1*randn(1);xs_p(3)+0.1*randn(1);xs_p(4)+0.01*randn(1);xs_p(5)+0.001*randn(1)] ;
    
       
    
    %%%%%%%%%% Estimation by kalman filter starts  %%%%%%%%
        
    [X_est, Po_est] = kalman_main(y_plant, xs_model, u_current, Po_est, Kt);
    
    %  controllability and observability condition checking
    rank_ctr(Kt) = rank(ctrb(Phi_est, Gamma_est));
    rank_ob(Kt) = rank(obsv(Phi_est, C_est));
    
    %xs_plant =X_est';
    xs_plant =xs_p';
    xs_model = X_est' ;
    x_estimated=[x_estimated;X_est'];
    x_true=[x_true,xs_p];
    
    
end



figure(1)
subplot(3, 2, 1) ;  plot([0:Ts:Kt],x_estimated(:,1),'k-*'); hold on
subplot(3, 2, 1) ;  plot([0:Ts:Kt],x_true(1,:),'r-.');
ylabel('x_{1}')
xlabel('Time Instant')
legend('Estimated','true');
legend boxoff

subplot(3, 2, 2) ;  plot([0:Ts:Kt],x_estimated(:,2),'k-*'); hold on
subplot(3, 2, 2) ;  plot([0:Ts:Kt],x_true(2,:),'r-.');
ylabel('x_{2}')
xlabel('Time Instant')
legend('Estimated','true');
legend boxoff

xlabel('Time Instant')
subplot(3, 2, 3) ;  plot([0:Ts:Kt],x_estimated(:,3),'k-*'); hold on
subplot(3, 2, 3) ;  plot([0:Ts:Kt],x_true(3,:),'r-.');
ylabel('x_{3}')
legend('Estimated','true');
legend boxoff

subplot(3, 2, 4) ;  plot([0:Ts:Kt],x_estimated(:,4),'k-*'); hold on
subplot(3, 2, 4) ;  plot([0:Ts:Kt],x_true(4,:),'r-.');
ylabel('x_{4}')
xlabel('Time Instant')
legend('Estimated','true');
legend boxoff

subplot(3, 2, 5) ;  plot([0:Ts:Kt],x_estimated(:,5),'k-*'); hold on
subplot(3, 2, 5) ;  plot([0:Ts:Kt],x_true(5,:),'r-.');
ylabel('x_{5}')
xlabel('Time Instant')
legend('Estimated','true');
legend boxoff

subplot(3, 2, 6) ;  plot([0:Ts:Kt],x_estimated(:,6),'k-*'); hold on
subplot(3, 2, 6) ;  plot([0:Ts:Kt],x_true(6,:),'r-.');
ylabel('x_{6}')
xlabel('Time Instant')
legend('Estimated','true');
legend boxoff


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=findobj(gcf); % get the handles associated with the current figure

allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);

















% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     pre_tspa = 0 ; %initial time for start of integration
%     tspa =10 ;  %tspan in observer code is [pre_tspa_est, tspa_est]
%     initial_state_model =  initial_state ;
%     com_input = u_current ;
%     simoptions = simset( 'InitialState' , initial_state_model , 'RelTol' , 1e-5 , 'Solver' , 'ode45' ) ;
%     sim_ut_est = [[pre_tspa tspa]' [com_input;com_input]];
%     sim_timespan = [pre_tspa, tspa];
%     [sim_t, sim_x, sim_y] = sim('simlogist', sim_timespan, simoptions, sim_ut_est) ;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     options = odeset('RelTol', 1e-05) ;
%     [ t, x ] = ode45(@odefun_logist , sim_timespan, initial_state_model, options, u_current) ;
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







% figure
% plot(t,x(:,1),'r')
% hold on
% plot(t,x(:,3),'b')
% plot(t,x(:,2),'g')
% hold on
% hold on
% plot(t,x(:,4),'y')
% hold on
% plot(t,x(:,5),'k')
% hold on
% plot(t,x(:,6),'m')
% hold on
% plot(t,x(:,7),'.m')
%
% legend('x1','x2','x3','x4','x5','x6','x7')
% grid
%
