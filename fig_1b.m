figure;
yyaxis left
load('us0.3_linlog.mat')
g_k=gradient(imag(ir),k_in);
plot(k_in,g_k, '-','Color', 'b','LineWidth',2);
hold on;
load('us0.5_linlog.mat')
g_k=gradient(imag(ir),k_in);
plot(k_in(15:end), g_k(15:end),'--', 'Color', 'b','LineWidth',2);
xlabel('$k,$ m$^{-1}$','Interpreter','latex');
ylabel('$d\gamma/dk$, m/s','Interpreter','latex');
hold off
ax=gca;
ax.YColor = 'b'; 
%ylim([-5 40])

yyaxis right
load('us0.3_linlog.mat')
cg=gradient(real(ir),k_in);
plot(k_in, cg,'-', 'Color', 'r','LineWidth',2);
hold on;
load('us0.5_linlog.mat')
cg=gradient(real(ir),k_in);
plot(k_in(15:end), cg(15:end),'--' ,'Color', 'r','LineWidth',2);
%xlabel('$k,$ m$^{-1}$','Interpreter','latex');
ylabel('$c_g=d\omega/dk$, m/s','Interpreter','latex');
hold off
%ylim([-5 40])


%set(gca, 'YScale', 'log');   % <-- enforce log scale
grid on;
set(gca,'TickLabelInterpreter','latex','FontSize',16)
    l=legend('$u_*=0.3$ m/s', '$u_*=0.5$ m/s', 'Location','north');
    set(l,'Interpreter','latex')

    ax = gca;
ax.YAxis(1).Color = 'b';   % Left axis
ax.YAxis(2).Color = 'r';   % Right axis
    savefig('fig_1b.fig')
%xlabel('$\beta$','Interpreter','latex')
