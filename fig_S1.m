close all
clear all

addpath('Faddeeva_MATLAB\');
load("numeric_abs_example.mat")
%% 

clr=['k' 'b' 'r' 'm'];
tt=[100 200 300 400]
hold on
for iit=1:length(tt)
    it=tt(iit);
    Ct(:)=ct(it,:);
    Ctt(:)=ctt(it,:);
    plot(xx, abs(Ct), 'Color', clr(iit),'LineWidth',2);
    plot(xx, abs(Ctt),'--', 'Color', clr(iit),'LineWidth',2);
    
    
%h(9+it)=xline(cgr(27)*t,':','Color', clr(it),'LineWidth',1.5);

end
% for it=length(tt):-1:1
%     t=tt(it);
% 
%     C=(exp(lmd2*x).*1/2.*Faddeeva_erfc( (x-V2*t+2*D2*lmd2*t)./sqrt(4*D2*t))+exp(g2*t)*1/2*Faddeeva_erfc( -(x-V2*t)/sqrt(4*D2*t)));
% 
%     h(4+it)=plot(x, abs(C), '--','Color', clr(it),'LineWidth',2,'DisplayName', sprintf('t = %.0f s, $\\lambda$= %.2f m', t, 2*pi/k_in(45)));
% %h(6+it)=xline(cgr(45)*t,':','Color', clr(it),'LineWidth',1.5);
% end
% 
xlim([0 5])
ylim([0.1 1e3])
xlabel('$\xi$','Interpreter','latex');
ylabel('$|\Psi|$','Interpreter','latex');
hold off
%set(gca, 'YScale', 'log');   % <-- enforce log scale
grid on;
set(gca,'TickLabelInterpreter','latex','FontSize',16)
    % l=legend('$u_*=0.3$ m/s', '$u_*=0.5$ m/s', 'GC waves', 'Location','southwest');
    % l=legend('NumColumns',2)
    % set(l,'Interpreter','latex')
set(gca, 'YScale', 'log');   % <-- enforce log scale
    savefig('fig_S1.fig')
%xlabel('$\beta$','Interpreter','latex')
