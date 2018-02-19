% this is kalman main file for PMMA
function [X_est, P_est] = kalman_main(y_plant, xs_model, u_current, Po_est, Kt)


%global no_of_measurements no_states  p
global Phi_est  Gamma_est  C_est  D_est
global R1_est  R2_est Ts


%  inputs that are common to the plant and observer models and define the input vector of the system
com_input = u_current ;

%     disp('linearization--->')
 [Phi_est, Gamma_est, C_est, D_est] = dlinmod('simlogist', Ts, xs_model, com_input) ;
%[Phi_est, Gamma_est, C_est, D_est] = gradientn( xs_model, com_input,Ts)%     disp('Calculation of Kalman Gain');
[G_est, P_est] = kalm(Phi_est, Gamma_est, C_est, R1_est, R2_est, Po_est) ;

%%%%%%%%%%%%%%%%%%%%%%%%%% STATE ESTIMATION (PREDICTION STEP) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pre_tspa_est = (Kt-1)*Ts ; %initial time for start of integration
tspa_est = Kt*Ts ;  %tspan in observer code is [pre_tspa_est, tspa_est]
initial_state_model = xs_model ;
simoptions = simset( 'InitialState' , initial_state_model , 'RelTol' , 1e-5 , 'Solver' , 'ode45' ) ;
sim_ut_est = [[pre_tspa_est tspa_est]' [com_input;com_input]];
sim_timespan = [pre_tspa_est, tspa_est];

[sim_t,sim_x,sim_y] = sim('simlogist',sim_timespan,simoptions,sim_ut_est);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pre_tspa_est = (Kt-1)*Ts ; 
% tspa_est = Kt*Ts ;  
% initial_state_model = xs_model ;
% options = odeset('RelTol', 1e-05) ;
% [ t, sim_x ] = ode45( @odefun_logist ,[pre_tspa_est, tspa_est], initial_state_model, options, com_input ) ;
% sim_y=sim_x(:,[1,3,4,5]);

Y_Hat = sim_y(end,:)';
X_est = sim_x(end,:)';

%%%%%%%%%%%%%%%%%%%%%%%%%% STATE ESTIMATION (CORRECTION STEP) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
innovations = y_plant - Y_Hat ;
X_est = X_est + G_est*innovations ;
