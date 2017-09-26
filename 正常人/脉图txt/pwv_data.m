function [pwv, number, rf, fre] = pwv_data(str)
%PWV Summary of this function goes here
%   Detailed explanation goes here
y = textread(str, '', 'headerlines', 1);

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
plot(s1);

N = length(s1);
t = 170;
% nn = 50;
% r = zeros(1, nn);
% for i=1:nn
%     if i==1
%         s = s1(1:t);
%         [v, index] = max(s);
%         r(i) = index;
%     else
%         x1 = r(i-1) + floor(t/2);
%         x2 = x1 + t;
%         s = s1(x1:x2);
%         [v, index] = max(s);
%         r(i) = index + x1 -1;
%         dt = r(i) - r(i-1);
%         if dt > 100
%             t = dt;
%         end
%     end
% end

x1 = 1;
x2 = t;
num = 1;
while (x1 < N)
    s = s1(x1:x2);
    [v, index] = max(s);
    p_r(num) = index + x1 - 1;
    x1 = p_r(num) + floor(t/ 2);
    x2 = x1 + t;
    if num > 1 && p_r(num) - p_r(num - 1) > 100 && p_r(num) - p_r(num - 1) < 350
        t = p_r(num) - p_r(num - 1);
    end
    if x2 > N
        x2 = N;
    end
    num = num + 1;
end

nn = length(p_r);
rr = ones(1,nn+1);
for i=1:nn
    rr(i+1) = p_r(i);
end

min_r = zeros(1,nn);
for i=1:nn
    s = s1(rr(i):rr(i+1));
    minindex = findminpoint(s);
    min_r(i) = rr(i) + minindex - 1;
end

dis = zeros(1, nn-1);
for i=1:nn-1
    dis(i) = min_r(i+1) - min_r(i);
end

% min_r
md = median(dis, 2);
% dis
num = 1;
for i=1:nn-1
    if abs(md - dis(i)) < 15
        chosen_p(num) = i;
        num = num + 1;
    end
end

% chosen_p
for i=1:length(chosen_p);
    td = chosen_p(i);
    ms1 = s1(min_r(td):min_r(td+1));

%     figure(1);
%     plot(ms1);

    N = length(ms1);
    n = 0:N-1; fs=200;
    t =n/fs;
    yy = fft(s1, N) / N * 2;
    mag = abs(yy);
    f = n*fs/N;
%     figure(2);
%     plot(f(1:N/2), mag(1:N/2));

    s2 = mag(2:N);
    index = 1;

%     figure(3);
    x = 1:10;
    x1 = x * index + 1;
    plot(x, mag(x1));

    t = mag(x1);
    p = get_pwv(t);
    p_arr(i) = p;
    
    if p == 1
        v = max(t);
        r = 1 - t(1) / v;
    else
        r = 1 - t(p) / t(1);
    end
    
    r_arr(i) = r; 
end


[pwv, number, rf] = get_majority(p_arr, r_arr);
fre = get_first_fre(dis);
[ppr, ttr] = new_get_pwv(p_arr, r_arr);

ppr
ttr
p_arr

if fre < 1
    str
    dis
end
    
fre = get_first_fre(dis);

end

