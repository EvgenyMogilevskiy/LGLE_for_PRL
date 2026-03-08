close all
clear all

addpath('Faddeeva_MATLAB\');
x=0:0.001:15;
tt=1:1:4
clr=['k' 'b' 'r' 'm'];

figure;
vi=1e-1;
di=-0.25e-2;
dr=1e-3;

D1=dr+1i*di;;
V1=1+1i*vi;

D2=dr-1i*di;;;
V2=1+1i*vi;

lmd1=(V1-sqrt(V1^2-4*D1))/(2*D1);
lmd2=(V2-sqrt(V2^2-4*D2))/(2*D2);

h = gobjects(8,1);
hold on
for it=length(tt):-1:1
    t=tt(it);
    C=(exp(lmd1*x).*1/2.*Faddeeva_erfc( (x-V1*t+2*D1*lmd1*t)./sqrt(4*D1*t))+exp(t)*1/2*Faddeeva_erfc( -(x-V1*t)/sqrt(4*D1*t)));
    
    plot(x, abs(C), 'Color', clr(it),'LineWidth',2);
    xline(t,':', 'Color', clr(it),'LineWidth',2);
    
%h(9+it)=xline(cgr(27)*t,':','Color', clr(it),'LineWidth',1.5);

end
t=tt(end);
    z=x-V1*t;
    Ct=exp(t)*sqrt(D1*t/pi)*2*lmd1*D1*t./z.^2.*exp(-z.^2/4/D1/t);

plot(x, abs(Ct),'--', 'Color', [0.0 0.5 0.0],'LineWidth',1);
% for it=length(tt):-1:1
%     t=tt(it);
% 
%     C=(exp(lmd2*x).*1/2.*Faddeeva_erfc( (x-V2*t+2*D2*lmd2*t)./sqrt(4*D2*t))+exp(g2*t)*1/2*Faddeeva_erfc( -(x-V2*t)/sqrt(4*D2*t)));
% 
%     h(4+it)=plot(x, abs(C), '--','Color', clr(it),'LineWidth',2,'DisplayName', sprintf('t = %.0f s, $\\lambda$= %.2f m', t, 2*pi/k_in(45)));
% %h(6+it)=xline(cgr(45)*t,':','Color', clr(it),'LineWidth',1.5);
% end
% 
xlim([0 6])
ylim([1 2e3])
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
    savefig('fig_2b.fig')
%xlabel('$\beta$','Interpreter','latex')
