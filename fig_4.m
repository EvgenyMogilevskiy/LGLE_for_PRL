close all
clear all

addpath('Faddeeva_MATLAB\');
x=0:0.001:25;
tt=0.1:.1:8;
clr=['k' 'b' 'r' 'm'];

figure;
vi=1e-1;
di=-0.5e-2;
dr=1e-3;

D1=dr+1i*di;;
V1=1+1i*vi;

D2=dr-1i*di;

V2=1+1i*vi;

lmd1=(V1-sqrt(V1^2-4*D1))/(2*D1);


hold on
for it=1:length(tt)
    t=tt(it);
    C=(exp(lmd1*x).*1/2.*Faddeeva_erfc( (x-V1*t+2*D1*lmd1*t)./sqrt(4*D1*t))+exp(t)*1/2*Faddeeva_erfc( -(x-V1*t)/sqrt(4*D1*t)));
    [mC1(it),im(it)]=max(abs(C));
end

vi=1e-1;
di=0.5e-2;
dr=1e-3;

D1=dr+1i*di;;
V1=1+1i*vi;

D2=dr-1i*di;

V2=1+1i*vi;

lmd1=(V1-sqrt(V1^2-4*D1))/(2*D1);


hold on
for it=1:length(tt)
    t=tt(it);
    C=(exp(lmd1*x).*1/2.*Faddeeva_erfc( (x-V1*t+2*D1*lmd1*t)./sqrt(4*D1*t))+exp(t)*1/2*Faddeeva_erfc( -(x-V1*t)/sqrt(4*D1*t)));
    [mC2(it),im(it)]=max(abs(C));
end

vi=0.5e-1;
di=0.5e-2;
dr=0.5e-3;

D1=dr+1i*di;;
V1=1+1i*vi;

D2=dr-1i*di;

V2=1+1i*vi;

lmd1=(V1-sqrt(V1^2-4*D1))/(2*D1);


hold on
for it=1:length(tt)
    t=tt(it);
    C=(exp(lmd1*x).*1/2.*Faddeeva_erfc( (x-V1*t+2*D1*lmd1*t)./sqrt(4*D1*t))+exp(t)*1/2*Faddeeva_erfc( -(x-V1*t)/sqrt(4*D1*t)));
    [mC3(it),im(it)]=max(abs(C));
end

vi=-0.5e-1;
di=0.5e-2;
dr=0.5e-3;

D1=dr+1i*di;;
V1=1+1i*vi;

D2=dr-1i*di;

V2=1+1i*vi;

lmd1=(V1-sqrt(V1^2-4*D1))/(2*D1);


hold on
for it=1:length(tt)
    t=tt(it);
    C=(exp(lmd1*x).*1/2.*Faddeeva_erfc( (x-V1*t+2*D1*lmd1*t)./sqrt(4*D1*t))+exp(t)*1/2*Faddeeva_erfc( -(x-V1*t)/sqrt(4*D1*t)));
    [mC4(it),im(it)]=max(abs(C));
end



plot(tt, abs(mC2),'-', 'Color','r','LineWidth',2);
plot(tt, abs(mC1),'-', 'Color','b','LineWidth',2);

plot(tt, abs(mC3),'-', 'Color','m','LineWidth',2);
plot(tt, abs(mC4),'-', 'Color','g','LineWidth',2);


vi1=1e-1;
dr1=1e-3;
vi2=0.5e-1;
dr2=0.5e-3;

plot(tt, mC1(end)*exp(vi1^2/dr1*tt/4+tt)/exp(vi1^2/dr1*tt(end)/4+tt(end)),'--', 'Color','k','LineWidth',2);
plot(tt, mC3(end)*exp(vi2^2/dr2*tt/4+tt)/exp(vi2^2/dr2*tt(end)/4+tt(end)),'--', 'Color','k','LineWidth',2);
plot(tt, exp(tt),'--', 'Color','k','LineWidth',2);


% for it=length(tt):-1:1
%     t=tt(it);
% 
%     C=(exp(lmd2*x).*1/2.*Faddeeva_erfc( (x-V2*t+2*D2*lmd2*t)./sqrt(4*D2*t))+exp(g2*t)*1/2*Faddeeva_erfc( -(x-V2*t)/sqrt(4*D2*t)));
% 
%     h(4+it)=plot(x, abs(C), '--','Color', clr(it),'LineWidth',2,'DisplayName', sprintf('t = %.0f s, $\\lambda$= %.2f m', t, 2*pi/k_in(45)));
% %h(6+it)=xline(cgr(45)*t,':','Color', clr(it),'LineWidth',1.5);
% end
% 
xlim([0 8])
ylim([1 1e6])
xlabel('$\tau$','Interpreter','latex');
ylabel('$\max|\Psi|$','Interpreter','latex');
hold off
%set(gca, 'YScale', 'log');   % <-- enforce log scale
grid on;
set(gca,'TickLabelInterpreter','latex','FontSize',16)
    % l=legend('$u_*=0.3$ m/s', '$u_*=0.5$ m/s', 'GC waves', 'Location','southwest');
    % l=legend('NumColumns',2)
    % set(l,'Interpreter','latex')
set(gca, 'YScale', 'log');   % <-- enforce log scale
    savefig('fig_4.fig')
%xlabel('$\beta$','Interpreter','latex')
