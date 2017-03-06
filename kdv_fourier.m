% Fast Fourier Transform (FFT) based solver of the KdV equation
% taken from http://www.wikiwaves.org/Numerical_Solution_of_the_KdV

clear all;
clc;
close all;


for j=1:100

N = 1024;
t=0.01*j;
x = linspace(-10,10,N);
delta_x = x(2) - x(1);
delta_k = 2*pi/(N*delta_x);
k = [0:delta_k:N/2*delta_k,-(N/2-1)*delta_k:delta_k:-delta_k];
f = exp(-x.^2);
f_hat = fft(f);
u = real(ifft(f_hat.*exp(i*k.^3*t)));
A(j,:)=u;
end


for j=1:100
plot(x,A(j,:))
xlim([-10 10])
ylim([-0.4 1])
drawnow
pause(1/30)
end