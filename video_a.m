close all
clear all

addpath('Faddeeva_MATLAB\');
load("numeric_2a_example.mat")
%%
v = VideoWriter('video_2a.avi');   % file name
v.FrameRate = 10;                      % adjust as needed
open(v);

figure
close all
nums=[length(Ts) 1:length(Ts)];
for iit1 = 1:length(nums)%1:length(Ts)
    iit=nums(iit1);
    Ctt(:) = ctt(iit,:);
    
    plot(xx, abs(Ctt), 'k','LineWidth',2);
    hold on
    
    t = Ts(iit);
    x = xx;
    z = x - V*t;
    
    Ca = exp(t) * sqrt(D*t/pi) * 2*lmd*D*t ./ z.^2 .* exp(-z.^2/4/D/t);
    
    plot(xx, abs(Ca),'--r','LineWidth',2);
    ix=max(find(xx<t));
    plot(xx(1:ix),exp(xx(1:ix)),':b', 'LineWidth',2);
    plot(xx(ix:end),exp(t)*ones(1,length(xx)-ix+1),':b', 'LineWidth',2);
    
    %xline(t, ':b', 'LineWidth',2);
    xlim([0 10])
    ylim([1 2e3])
    xlabel('$\xi$','Interpreter','latex');
    ylabel('$|\Psi|$','Interpreter','latex');
    grid on;
    
    set(gca,'TickLabelInterpreter','latex','FontSize',16)
    
%    title(['Evolution of the envelope \\\\ $v_i=10^{-1}$, $d_i=0.5\cdot10^{-2}$, $d_r=10^{-3}$.\\\\ $\tau = ' num2str(Ts(iit),'%.2f') '$'], ...
%      'Interpreter','latex', ...
%      'FontSize',18)
title({ ...
'Shape of the envelope', ...
'$v_i=10^{-1}$, $d_i=0.5\cdot10^{-2}$, $d_r=10^{-3}$.', ...
['$\tau = ' num2str(Ts(iit),'%.2f') '$']}, ...
'Interpreter','latex','FontSize',18) 
set(gca, 'YScale', 'log');

     l=legend('LGLE solution (15)','asymptotics (17)','TE solution (12)', 'Location','southeast');
     set(l,'Interpreter','latex')
    
    drawnow   % ensure frame is rendered
    
    frame = getframe(gcf);
    writeVideo(v, frame);
    
    hold off
end


close(v)