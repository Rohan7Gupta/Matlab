clc;
clear all;
close all;
N=input('enter the number of signals to be multiplexed ');
f=zeros(1,N);
for i=1:N
    f(i)=input('enter the frequency of the signal ');
end
fs=2*max(f);
T=input('enter the duration over which the signal is to be plotted ');
t=0:T/fs:T;
Q=zeros(1,N*length(t));
R=Q;
S=Q;
for i=1:N
    Q(:,((i-1)*length(t))+1:i*length(t))=cos(2*pi*f(i)*t);
end
j=1;
for i=0:N:length(Q)-N
    for n=1:N
        R(i+n)=Q(j+(n-1)*length(t));
        S(j+(n-1)*length(t))=R(i+n);
    end
    j=j+1;
end
t1=0:T/fs:N*T;
for i=length(t1)+1:length(Q)
    t1(i)=t1(length(t1));
end
subplot(N+2,1,1)
plot(t1,Q)
title('Signals to be Multiplexed')
subplot(N+2,1,2)
stem(t1,R)
title('Multiplexed Signal')
for i=1:N
    subplot(N+2, 1,i+2)
    plot(t,S(:,((i-1)*length(t))+1:i*length(t)))
    title('De-multiplexed Signal' )
end