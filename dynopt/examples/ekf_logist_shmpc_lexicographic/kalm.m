% this is kalman riccati equation for  PMMA
function [G_est,P_est] = kalm(Phi_est, Gamma_est, C_est, R1_est, R2_est, Po_est)
    G_est = Phi_est*Po_est*C_est'*inv((R2_est + C_est*Po_est*C_est'));    %Kalman Gain        
    P_est = Phi_est*Po_est*Phi_est' + R1_est - G_est*C_est*Po_est*Phi_est' ; % Estimation error
    % covariance
return