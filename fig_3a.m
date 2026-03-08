%close all
clear all

addpath('Faddeeva_MATLAB\');


vi=1e-1;
dr=1e-3;
di=0.5e-2;
D=dr+1i*di;

 V=1+1i*vi;
 lmd=(V-sqrt(V^2-4*D))/(2*D);

tt=0:0.01:10;
xx=0:0.001:25;

for it=1:length(tt)
    t=tt(it);
    C=(exp(lmd*(xx)).*1/2.*Faddeeva_erfc( (xx-V*t+2*D*lmd*t)./sqrt(4*D*t))+exp(t)*1/2*Faddeeva_erfc( -(xx-V*t)/sqrt(4*D*t)));
    [mC(it),im(it)]=max(abs(C));
    r=abs(C/exp(t));
    ind=find(abs(r)>2);
    if(length(ind)>1)
    left(it)=xx(min(ind));
    right(it)=xx(max(ind));
    end
end
itmin=min(find(left>0));

figure;

plot(tt(itmin:end), left(itmin:end), 'Color', 'b','LineWidth',2);
hold on

fill([tt(itmin:end) fliplr(tt(itmin:end))], [left(itmin:end) fliplr(right(itmin:end))], ...
     [0.5 0.5 0.5], 'EdgeColor','none', 'FaceAlpha',0.3);
plot(tt(itmin:end),right(itmin:end),'-','LineWidth',2,'Color','r')
plot(tt, xx(im), 'Color', 'k','LineWidth',2);

plot(tt,(1+2*vi*di/dr)*tt,'--','LineWidth',2,'Color','r')
plot(tt,tt,'--','LineWidth',2,'Color','b')
plot(tt,(1+vi*di/dr)*tt-4*di/vi,'--','LineWidth',2,'Color','k')


%xlim([min(zr) max(zr)])
%ylim([min(zi) max(zi)])
ylim([0 20])
xlabel('$\tau$','Interpreter','latex');
ylabel('$\xi$','Interpreter','latex');

%set(gca, 'YScale', 'log');   % <-- enforce log scale
grid on;
set(gca,'TickLabelInterpreter','latex','FontSize',16)
   %  l=legend('right', 'left',  '$(c_g+2v_id_i/dr)\tau$', '$c_g\tau$','Location','northwest');
    %l=legend(h([1 2 3 4 5 6]),'NumColumns',2)
   % set(l,'Interpreter','latex')
%set(gca, 'YScale', 'log');   % <-- enforce log scale
    savefig('fig_3a.fig')
%xlabel('$\beta$','Interpreter','latex')
