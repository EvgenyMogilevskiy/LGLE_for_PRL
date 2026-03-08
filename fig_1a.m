figure;
yyaxis left
load('us0.3_linlog.mat')
g=imag(ir);
plot(k_in,g, '-','Color', 'b','LineWidth',2);
hold on;
load('us0.5_linlog.mat')
g=imag(ir);
plot(k_in(15:end), g(15:end),'--', 'Color', 'b','LineWidth',2);
xlabel('$k,$ m$^{-1}$','Interpreter','latex');
ylabel('$\gamma$, s$^{-1}$','Interpreter','latex');
hold off
ax = gca; 
ax.YColor = 'b'; 
ylim([-5 40])

yyaxis right
load('us0.3_linlog.mat')
om=real(ir);
plot(k_in, om,'-', 'Color', 'r','LineWidth',2);
hold on;
load('us0.5_linlog.mat')
om=real(ir);
plot(k_in(15:end), om(15:end),'--' ,'Color', 'r','LineWidth',2);
%xlabel('$k,$ m$^{-1}$','Interpreter','latex');
ylabel('$\omega$, s$^{-1}$','Interpreter','latex');
hold off
%ylim([-5 40])


%set(gca, 'YScale', 'log');   % <-- enforce log scale
grid on;
set(gca,'TickLabelInterpreter','latex','FontSize',16)
%    l=legend('$u_*=0.3$ m/s', '$u_*=0.5$ m/s', 'Location','north');
%    set(l,'Interpreter','latex')

    ax = gca;
ax.YAxis(1).Color = 'b';   % Left axis
ax.YAxis(2).Color = 'r';   % Right axis
    savefig('fig_1a.fig')
%xlabel('$\beta$','Interpreter','latex')
