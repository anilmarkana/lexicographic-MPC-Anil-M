load optimprofiles tplot uplot xplot
close all
% ploting
%..........................................................................
figure
plot(tplot,uplot(:,1),'b',tplot,uplot(:,2),'r')
title('')
xlabel('time')
ylabel('u')
legend('glucose','starch')




figure
plot(tplot,xplot(:,1),'b:',tplot,xplot(:,2),'k-',tplot,xplot(:,3),'r:',tplot,xplot(:,4),'g:',tplot,xplot(:,5),'m:')
title('')
xlabel('time')
ylabel('states')
legend('substrate','starch','glucose','product','volume')
grid

%..........................................................................