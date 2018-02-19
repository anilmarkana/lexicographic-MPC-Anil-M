load optimprofiles tplot2 uplot2 xplot2

% ploting
%..........................................................................
plot(tplot2,uplot2,'k')
title('')
xlabel('time')
ylabel('u')
axis tight %([0 1 0 5])
set(1,'PaperUnits','centimeters')
set(1,'PaperPosition',[3 10 11 8.25])

print -depsc u.eps
figure

plot(tplot2,xplot2(:,1),'b:',tplot2,xplot2(:,2),'k-')
title('')
xlabel('time')
ylabel('x_1, x_2')
legend('x_1','x_2',1)
axis tight %([0 1 0 1])
set(1,'PaperUnits','centimeters')
set(1,'PaperPosition',[3 10 11 8.25])

print -depsc x.eps
close
%..........................................................................