function c1 = timestep_semiimpl(c,c0,x,dt,g,cg,okk)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

N=length(x);
dx=x(2)-x(1);
D=1i/2*okk;

V=cg;%1+0.1*1i;

%cx=gradient(c,x);
%cxx=gradient(cx,x);

%c1=c+dt*(-V.*cx+D.*cxx+g.*c);
%c1(1)=c0;
%c1(N)=c1(N-1);


n=2:N-1; %inner points

A(n)=dt/2*(-V(n)/dx/2-D(n)/dx^2);
B(n)=1+dt/2*(+2*D(n)/dx^2-g(n));
C(n)=dt/2*(V(n)/dx/2-D(n)/dx^2);

F(n)=c(n)-dt/2*( V(n).*(c(n+1)-c(n-1))/dx/2-D(n).*(c(n+1)-2*c(n)+c(n-1))/dx^2-g(n).*c(n)  );

alp=zeros(1,N);
bet=zeros(1,N);

alp(1)=0;
bet(1)=c0;

for i=2:N-1
    alp(i)=-C(i)./(A(i).*alp(i-1)+B(i));
    bet(i)=(F(i)-A(i).*bet(i-1))./(A(i).*alp(i-1)+B(i));
end

v=V(end);
p=2*dx/v*( 1/dt+v/2/dx-g(end)/2 );
q=2*dx/v*(-c(N)/dt+1/2*v*(c(N)-c(N-1))/dx-g(end)/2*c(N)  );

c1(N)=-(q-bet(N-1))/(p-alp(N-1));
%c1(N)=bet(N-1)/(1-alp(N-1));

for i=N:-1:2
c1(i-1)=alp(i-1).*c1(i)+bet(i-1);
end

end