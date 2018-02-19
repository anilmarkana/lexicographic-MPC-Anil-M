load optimprofiles tplot uplot xplot

% ploting
%..........................................................................
figure
plot(tplot,uplot,'k')
title('')
xlabel('time')
ylabel('u')
legend('u1','u2')





figure
plot(tplot,xplot(:,1),'b:',tplot,xplot(:,2),'k-',tplot,xplot(:,3),'r:',tplot,xplot(:,4),'g:',tplot,xplot(:,5),'m:')
title('')
xlabel('time')
ylabel('x')
legend('xa','xb','xc','xp','xe')

%..........................................................................