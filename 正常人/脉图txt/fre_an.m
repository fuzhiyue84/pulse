clear all;
str = '20150812015 - ½¯¹ãÆ½ - ÓÒ.txt';
y = textread(str, '', 'headerlines', 1);
% ss = textread(str, '%s');
% y = hex2dec(ss);
% plot(y);
% hold on
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
s1 = s1;
% s1 = s1';
% ms1 = mapminmax(s1, 0, 1);
% ms1 = ms1';
% 
figure(1);
plot(s1);

t = 170;
nn = 50;
r = zeros(1, nn);
for i=1:nn
    if i==1
        s = s1(1:t);
        [v, index] = max(s);
        r(i) = index;
    else
        x1 = r(i-1) + floor(t/2);
        x2 = x1 + t;
        s = s1(x1:x2);
        [v, index] = max(s);
        r(i) = index + x1 -1;
        dt = r(i) - r(i-1);
        if dt > 100
            t = dt;
        end
    end
end

rr = ones(1,nn+1);
for i=1:nn
    rr(i+1) = r(i);
end

min_r = zeros(1,nn);
for i=1:nn
    s = s1(rr(i):rr(i+1));
    minindex = findminpoint(s);
    min_r(i) = rr(i) + minindex - 1;
end

min_r
start_pos = 20;
ms1 = s1(min_r(start_pos):min_r(start_pos+1));
figure(2);
plot(ms1)

N = length(ms1);
n = 0:N-1; fs=200;
t =n/fs;
yy = fft(ms1, N) / N * 2;
mag = abs(yy);
f = n*fs/N;
figure(3);
plot(f(1:N/2), mag(1:N/2));

s2 = mag(2:N);
[v, index] = max(s2);
index = 1;

figure(4);
x = 1:10;
x1 = x * index + 1;
pwv_data = mag(x1);

np = findPwv(pwv_data)
plot(pwv_data);