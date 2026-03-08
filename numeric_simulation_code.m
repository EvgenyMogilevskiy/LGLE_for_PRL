clear all;
addpath("Faddeeva_MATLAB\")

dx=1e-4;
L=5;
xx=dx:dx:L;
dt=0.001;
T=5;
time=dt:dt:T;
Nta=length(time);
%Nt=length(time);
%c=1*ones(1,length(xx));
c0=1;




%c(:)=ones(1,length(xx));
%c1(:)=ones(1,length(xx));

vi=1e-1;
di=-1e-2;
dr=1e-3;

V=1+1i*vi;
D=dr+1i*di;

gv=ones(1,length(xx));
Vv=V*ones(1,length(xx));
Dv=D*ones(1,length(xx));
step=10;
J=0;
Nt=floor(T/dt/step);

Nr=50;
lc=10;
tc=10;
ct=zeros(Nt,length(xx));
c=ones(1,length(xx));
c1=ones(1,length(xx));
    for J=1:Nt
    tic
    t0=(J-1)*step*dt
    Ts(J)=J*step*dt;
  
    %ik
    %lw=2*pi/kk(ik)
    c(:)=c1(:);
    
    for j=1:step
        t=t0+j*dt;
        c1=timestep_semiimpl_bc(c,1,xx,dt,gv,Vv,(Dv)/(1i/2));
        c=c1;
    end
    ct(J,:)=c1(:);
    lmd=(V-sqrt(V^2-4*D))/(2*D);
    ctt(J,:)=(exp(lmd*xx).*1/2.*Faddeeva_erfc( (xx-V*Ts(J)+2*D*lmd*Ts(J))./sqrt(4*D*Ts(J)))+exp(Ts(J))*1/2*Faddeeva_erfc( -(xx-V*Ts(J))/sqrt(4*D*Ts(J))));
    %ckt(ik,J,:)=c1(:);
    toc
    end
    
save('numeric_abs_example.mat')

% 
% c=ones(1,length(xx));
% c1=c;
% 
% g0=g;
% cg0=cg;
% okk0=okk;
% 
% gv=g0*ones(1,length(xx));
% cg=cg0*ones(1,length(xx));
% okk=okk0*ones(1,length(xx));
% 
% for j=1:Nt
%     t=j*dt;
%     if mod(j,step)==0
%         toc
%         S=j*dt
%         % x1=xx(min(find(abs(c1-lmd*xx)>1e-3)))
%         % X1(j/step)=x1;
%         % x2=xx(min(find(abs(c1(20:end)-g*t)<1e-3)))
%         % X2(j/step)=x2;
%         % 
%         TS(j/step)=t;
%         cc(j/step,:)=c1(:);
% 
%         gv=g*ones(1,length(xx));
%         cg=cg0*ones(1,length(xx));
%         okk=okk0*ones(1,length(xx));
% 
%         ind=find(abs(c1)>1e5);
%         im=min(ind);
%         iM=max(ind);
%         gv(im:iM)=-2*nu*k^2;%/gd;
%         cg(im:iM)=real(cg(im:iM))-1i*4*nu*k;%/LL*TT;
%         okk(im:iM)=real(okk(im:iM))-1i*4*nu;%/LL^2*TT;
% 
%         gg(j/step,:)=gv(:);
%         tic
%     end
% 
%     %time(j)=t;
%     c0=1;%exp(-g*t);
%     %c1=timestep_g_iter(c,c0,xx,dt,g,cg,okk);
%     %c1=timestep_g_expl(c,c0,xx,dt,g,cg,okk);
%     %c1=timestep_expl(c,c0,xx,dt,gv,cg,okk);
%    c1=timestep_semiimpl(c,c0,xx,dt,gv,cg,okk);
%    c1(end-100:end)=c1(end-100);
% 
% %    cc(j,:)=c1;
%     c=c1;
%  %   cd(j,:)=c1*exp(g*t);
%     cd=(c1)*exp(-g*t);
% 
% 
%  %   c1t=1/2*Faddeeva_erfc(-(xx-V*t)/2/sqrt(kp*t))+1/2*exp(-g*t+lmd*xx).*Faddeeva_erfc( (xx-V*t-2*kp*lmd*t)/2/sqrt(kp*t) );    
%  %   cdt(j,:)=c1t*exp(g*t);
% 
% end
% 
% 
