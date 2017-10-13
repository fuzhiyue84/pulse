function [t1, t3, t4, h_1, h_3, h_4] = get_time_data( str )
%GET_TIME_DATA Summary of this function goes here
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
% figure(1);
% plot(s1);

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

p_r
for i=1:nn
    rr(i+1) = p_r(i);
end

rr
N
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
% fid = fopen('G:\workspace\matlab\height.txt', 'wt');
% fidi = fopen('G:\workspace\matlab\points.txt', 'wt');
in = 0;
for i=1:length(chosen_p)-1
    td = chosen_p(i);
    xx = s1(min_r(td):min_r(td+1));

       [h1, h3, h5, h4] = gettimepoint(xx);
        in = in + 1;
        indexes(in) = td;
        c_ind(in) = min_r(td);
        d = min_r(td+1) - min_r(td);
        
        dis(in) = d;
        
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

% m_d = mean(dis, 2);
% fid = fopen('G:\workspace\matlab\look.csv', 'a+');
% fprintf(fid, '%s,%.4f\n', str,m_d);
% fclose(fid);

t1 = mean(cc1, 2)
t3 = mean(c3, 2)
t4 = mean(c4, 2)
t5 = mean(c5, 2)
h_1 = mean(v1, 2)
h_3 = mean(v3, 2)
h_4 = mean(v4, 2)
h_5 = mean(v5, 2)

fid = fopen('G:\workspace\matlab\look3.csv', 'a+');
fprintf(fid, '%s,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n', str,t1,t3,t4,h_1,h_3,h_4);
fclose(fid);



end

