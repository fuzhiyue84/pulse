clear all;
str = '20150819082 - ÍõÖ¾Ç¿ - ÓÒ.txt';
y = textread(str, '', 'headerlines', 1);
% ss = textread(str, '%s');
% y = hex2dec(ss);
plot(y);
hold on
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

r

min_r = zeros(1,nn);
for i=1:nn
    s = s1(rr(i):rr(i+1));
    minindex = findminpoint(s);
    min_r(i) = rr(i) + minindex - 1;
end
min_r
x = diff1(min_r);
x

md = median(x,2);
md

in = 0;
% fid = fopen('G:\workspace\matlab\height.txt', 'wt');
% fidi = fopen('G:\workspace\matlab\points.txt', 'wt');
for i=1:nn-1
    if abs(x(i) - md) < 15
        xx = s1(min_r(i):min_r(i+1));
        [h1, h3, h5, h4] = gettimepoint(xx);
        in = in + 1;
        indexes(in) = i;
        c_ind(in) = min_r(i);
        d = min_r(i+1) - min_r(i);
        a1(in) = h1;
        a3(in) = h3;
        a4(in) = h4;
        a5(in) = h5;
        
        cc1(in) = h1 / d;
        c3(in) = h3 / d;
        c5(in) = h5 / d;
        c4(in) = h4 / d;
        
%         fprintf(fidi, '%d %d %d\n', h1, h3, h5);
        
        minv = min(xx);
        v1(in) = xx(h1) - minv;
        v3(in) = xx(h3) - minv;
        v5(in) = xx(h5) - minv;
        v4(in) = xx(h4) - minv;
        
%         fprintf(fid, '%.4f %.4f %.4f\n', v1, v3, v5);
    end 
end

md

t1 = mean(cc1, 2)
t3 = mean(c3, 2)
t4 = mean(c4, 2)
t5 = mean(c5, 2)
h_1 = mean(v1, 2)
h_3 = mean(v3, 2)
h_4 = mean(v4, 2)
h_5 = mean(v5, 2)

figure(5);
ss = s1(min_r(indexes(10)):min_r(indexes(10)+1));
plot(ss);

fid = fopen('G:\workspace\matlab\data_timezone2.csv', 'a+');
fprintf(fid, '%s,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n', str,t1,t3,t4,h_1,h_3,h_4);
fclose(fid);

% [h1, h3, h5, h4] = gettimepoint(ss);
% h1 / length(ss)
% h3 / length(ss)
% h4 / length(ss)
% h5 / length(ss)

% figure(2);
% plot(s1(3304:3439));

% fclose(fid);
% fclose(fidi);
% 
% b1 = sortnum(a1);
% b3 = sortnum(a3);
% b5 = sortnum(a5);
% 
% inn = 0;
% for i=1:in
%     if a1(i) > b1 - 7 && a1(i) < b1 + 7 && a3(i) > b3 - 7 && a3(i) < b3 + 7 && a5(i) > b5 - 7 && a5(i) < b5 + 7
%         inn = inn + 1;
%         s_in(inn) = i;
%     end
% end

% for i=1:inn
%     in_s(i) = indexes(s_in(i));
% end
% 
% figure(2);
% plot(s1(min_r(in_s(2)):min_r(in_s(2)+1)));

% xx = s1(1296:1474);
% diff1(xx)
% [h1, h3, h5] = gettimepoint(xx);
% 
% h1
% h3
% h5
%  
% d2 = diff2(xx);
% d2

% su = 5;
% xx = s1(min_r(indexes(su)):min_r(indexes(su)+1));
% figure(2);
% plot(xx);

% minx = min(xx);
% maxx = max(xx);
% xx = xx - minx;
% maxx = maxx - minx;
% 
% xx = xx / maxx * 100;
% 
% n = gausspoint(xx);
% n
% fid = fopen('G:\workspace\matlab\data_gauss.csv', 'a+');
% fprintf(fid, '%s,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n', str,n(1),n(2),n(3),n(4),n(5),n(6),n(7),n(8),n(9),n(10));
% fclose(fid);
% 
% t = 1:length(xx);
% 
% s = normpdf(t, n(1), n(2)) * n(3) + normpdf(t, n(4), n(5)) * n(6) + normpdf(t, n(7), n(8)) * n(9) + n(10);
% 
% s1 = normpdf(t, n(1), n(2)) * n(3)  + n(10);
% 
% s2 = normpdf(t, n(4), n(5)) * n(6) + n(10);
% 
% s3 = normpdf(t, n(7), n(8)) * n(9) + n(10);
% figure(2);
% plot(xx);
% hold on;
% plot(s);
% hold on;
% plot(s1);
% hold on;
% plot(s2);
% hold on;
% plot(s3);
% hold on;