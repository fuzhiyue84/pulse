y = textread('20060623003.txt');
ms1 = y(4377:4727);

N = length(ms1);
n = 0:N-1; fs=500;
t =n/fs;
yy = fft(ms1, N) / N * 2;
mag = abs(yy);
f = n*fs/N;

%     plot(f(1:N/2), mag(1:N/2));
s2 = mag(2:N);
index = 1;

%     figure(3);
x = 1:10;
x1 = x * index + 1;

figure(1);
plot(ms1);

figure(2);
plot(x, mag(x1));
