%PLOT FILE for conventional SHMPC WITH EKF and  LEXICOGRAPHIC  SHMPC with
%ekf
load('shmpc_conventionalmpc_data.mat')
clc;
clear all;
close all;


load('shmpc_lexicographic_data.mat') 
 figure
subplot(2,1,1)
stairs([0:10],[inputprofile(:,1);inputprofile(end,1)],'k')
clear all
load('shmpc_conventionalmpc_data.mat')
hold on
stairs([0:10],[inputprofile(:,1);inputprofile(end,1)],':k')
ylabel('Glucose feed,u_{1}, L/h')
legend('Lexicographic SHMPC','Conventional SHMPC');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')

subplot(2,1,2)
stairs([0:10],[inputprofile(:,2);inputprofile(end,2)],'k')
clear all
load('shmpc_conventionalmpc_data.mat')
hold on
stairs([0:10],[inputprofile(:,2);inputprofile(end,2)],':k')
ylabel('Inducer feed,u_{2} L/h')
xlabel('Time (hour)')
legend('Lexicographic SHMPC','Conventional SHMPC');

a=findobj(gcf); %

allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOTING OF STATES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,1)
plot(timeprofile,stateprofile(:,1),':k')
hold on
clear all
load('shmpc_conventionalmpc_data.mat')
plot(timeprofile,stateprofile(:,1),'k')

ylabel(' x_{1}, L')
legend('Lexicographic SHMPC','Conventional SHMPC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,2)
plot(timeprofile,stateprofile(:,2),'k:')
clear all
load('shmpc_conventionalmpc_data.mat')
hold on
plot(timeprofile,stateprofile(:,2),'k')
ylabel('x_{2}, g/L')
legend('Lexicographic SHMPC','Conventional SHMPC');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,3)
plot(timeprofile,stateprofile(:,3),'k:')
hold on
clear all
load('shmpc_conventionalmpc_data.mat')
plot(timeprofile,stateprofile(:,3),'k')

ylabel(' x_{3}, g/L')
legend('Lexicographic SHMPC','Conventional SHMPC');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,4)

plot(timeprofile,stateprofile(:,4),'k:')
clear all
load('shmpc_conventionalmpc_data.mat')
hold on
plot(timeprofile,stateprofile(:,4),'k')
ylabel('x_{4}, g/L')
legend('Lexicographic SHMPC','Conventional SHMPC');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,5)
plot(timeprofile,stateprofile(:,5),'k:')
hold on

plot(timeprofile,stateprofile(:,7),'b:')
hold on
clear all
load('shmpc_conventionalmpc_data.mat')
plot(timeprofile,stateprofile(:,5),'k')
hold on

plot(timeprofile,stateprofile(:,7),'b')
ylabel('States, g/L')
xlabel('Time (hour)')
legend('x_{5}Lexicographic SHMPC','x_{7}Lexicographic SHMPC','x_{5} Conventional SHMPC','x_{7}Conventional SHMPC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
load('shmpc_lexicographic_data.mat')
subplot(3,2,6)

plot(timeprofile,stateprofile(:,6),'k:')
hold on

clear all
load('shmpc_conventionalmpc_data.mat')

plot(timeprofile,stateprofile(:,6),'k')
xlabel('Time (hour)')
ylabel('x_{6}, g/L')
legend('Lexicographic SHMPC','Conventional SHMPC');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=findobj(gcf); %
allaxes=findall(a,'Type','axes');
alllines=findall(a,'Type','line');
alltext=findall(a,'Type','text');

set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
    'FontSize',18);
set(alllines,'Linewidth',2);
set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% clear all
% load('shmpc_lexicographic_data.mat')
% figure
% subplot(2,2,1)
% plot(timeprofile,stateprofile(:,2),'k-.')
% hold on
% plot(timeprofile,stateprofile(:,4),'m-.')
% clear all
% load('shmpc_lexicographic_withoutEKF_data.mat')
% plot(timeprofile,stateprofile(:,2),'k')
% hold on
% plot(timeprofile,stateprofile(:,4),'m')
% 
% ylabel('States, g/L')
% legend('x_{2} with EKF','x_{4} with EKF','x_{2} without EKF','x_{4} without EKF' );
% % legend boxoff
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% clear all
% load('shmpc_lexicographic_data.mat')
% subplot(2,2,2)
% plot(timeprofile,stateprofile(:,5),'k-.')
% hold on
% plot(timeprofile,stateprofile(:,6),'m-.')
% hold on
% plot(timeprofile,stateprofile(:,7),'b-.')
% hold on
% clear all
% load('shmpc_lexicographic_withoutEKF_data.mat')
% plot(timeprofile,stateprofile(:,5),'k')
% hold on
% plot(timeprofile,stateprofile(:,6),'m')
% hold on
% plot(timeprofile,stateprofile(:,7),'b')
% ylabel('States, g/L')
% legend('x_{5}with EKF','x_{6}with EKF','x_{7}with EKF','x_{5} without EKF','x_{6} without EKF','x_{7} without EKF');
% % legend boxoff
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% clear all
% load('shmpc_lexicographic_data.mat')
% subplot(2,2,3)
% plot(timeprofile,stateprofile(:,1),'k-.')
% hold on
% clear all
% load('shmpc_lexicographic_withoutEKF_data.mat')
% plot(timeprofile,stateprofile(:,1),'k')
% xlabel('Time (hour)')
% ylabel('Reactor volume, x_{1}, L')
% legend('with EKF','without EKF');
% % legend boxoff
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% clear all
% load('shmpc_lexicographic_data.mat')
% subplot(2,2,4)
% plot(timeprofile,stateprofile(:,3),'k-.')
% hold on
% clear all
% load('shmpc_lexicographic_withoutEKF_data.mat')
% plot(timeprofile,stateprofile(:,3),'k')
% xlabel('Time (hour)')
% ylabel('Nutrient Conc. x_{3}, g/L')
% legend('with EKF','without EKF');
% % legend boxoff



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% subplot(2,1,1)
% plot(timeprofile, stateprofile(:,2).*stateprofile(:,1),'k-.')
% ylabel('Cell mass x_{1}.x_{2}, g')
% 
% 
% subplot(2,1,2)
% plot(timeprofile, stateprofile(:,4).*stateprofile(:,1),'k-.')
% ylabel('Foreign protein mass x_{1}.x_{4}, g')
% xlabel('Time (hour)')
% 
% 
% a=findobj(gcf); %
% allaxes=findall(a,'Type','axes');
% alllines=findall(a,'Type','line');
% alltext=findall(a,'Type','text');
% 
% set(allaxes,'FontName','Times New Roman','FontWeight','Bold','LineWidth',2,...
%     'FontSize',18);
% set(alllines,'Linewidth',2);
% set(alltext,'FontName','Times New Roman','FontWeight','Bold','FontSize',18);

