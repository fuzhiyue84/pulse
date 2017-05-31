y = textread('20150817009 - ÍõÙÉÎä - ÓÒ.txt', '', 'headerlines', 1);

[c,l]=wavedec(y,8,'sym8'); 
a8=appcoef(c,l,'sym8',8); 
m = mean(a8);
a8(:) = m;
d8=detcoef(c,l,8); 
d7=detcoef(c,l,7); 
d6=detcoef(c,l,6); 
d5=detcoef(c,l,5); 
d4=detcoef(c,l,4); 
d3=detcoef(c,l,3); 
d2=detcoef(c,l,2); 
d1=detcoef(c,l,1);
c1 = [a8; d8; d7; d6; d5; d4; d3; d2; d1];
s1 = waverec(c1, l, 'sym8');

s1 = denwave(s1);

ms1 = s1(2678:2927);

figure(3);
plot(ms1)

N = length(ms1);
n = 0:N-1; fs=200;
t =n/fs;
yy = fft(ms1, N) / N * 2;
mag = abs(yy);
f = n*fs/N;
figure(1);
plot(f(1:N/2), mag(1:N/2));
s2 = mag(2:N);
index = 1;

figure(2);
x = 1:10;
x1 = x * index + 1;
plot(x, mag(x1));