load optimprofiles tplot uplot xplot

% ploting
%..........................................................................
figure
plot(tplot,uplot)
title('')
xlabel('time')
ylabel('u')
legend('u1','u2')

% figure
% plot(tplot,xplot(:,4),'b:',tplot,xplot(:,5),'k-')
% title('')
% xlabel('time')
% ylabel('Cp2 Cp3')
% legend('Cp2','Cp3')



figure
plot(tplot,xplot(:,1),'b:',tplot,xplot(:,2),'k-',tplot,xplot(:,3),'r:',tplot,xplot(:,4),'g:',tplot,xplot(:,5),'m:',tplot,xplot(:,6),'k*',tplot,xplot(:,7),'g*')
title('')
xlabel('time')
ylabel('states')
legend('x1','x2','x3','x4','x5','x6','x7')
                                                                     
%..........................................................................