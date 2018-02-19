load optimprofiles tplot uplot xplot
























% ploting
%..........................................................................
figure
plot(tplot,uplot(:,1),'k',tplot,uplot(:,2),'b')
title('')
xlabel('time')
ylabel('u')
legend('u1','u2')

figure
plot(tplot,xplot(:,1).*xplot(:,4),'b:',tplot,xplot(:,1).*xplot(:,2),'m:')
title('')
xlabel('time')
ylabel('x')
legend('x1x4','x1x2')



figure
plot(tplot,xplot(:,1),'b:',tplot,xplot(:,2),'k-',tplot,xplot(:,3),'r:',tplot,xplot(:,4),'g:',tplot,xplot(:,5),'m:')
title('')
xlabel('time')
ylabel('x')
legend('x1','x2','x3','x4','x5')

%..........................................................................