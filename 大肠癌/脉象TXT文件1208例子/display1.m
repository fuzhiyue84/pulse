y = textread('20140312001 - ÇñÏþÐÀ - ×ó.txt', '', 'headerlines', 1);

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

figure(5);
s = s1(3447:5300);
plot(s1);
hold on;
plot(s);

s = s(648:795);
    n = 0:N-1; fs=200;
    t =n/fs;
    yy = fft(s1, N) / N * 2;
    mag = abs(yy);
    f = n*fs/N;
%     figure(2);
%     plot(f(1:N/2), mag(1:N/2));

[start_point, end_point] = findstartpoint(s)
% t = s(35:161);
% figure(3);
% d = diff1(t);
% plot(d);
% 
% [h3, h4] = timezone(t, 35)

% s = s(96:209);
% N = length(s);
%     n = 0:N-1; fs=200;
%     t =n/fs;
%     yy = fft(s1, N) / N * 2;
%     mag = abs(yy);
%     f = n*fs/N;
% %     figure(2);
% %     plot(f(1:N/2), mag(1:N/2));
% 
%     s2 = mag(2:N);
%     index = 1;
% 
%    figure(3);
%     x = 1:10;
%     x1 = x * index + 1;
%     plot(x, mag(x1));
% 
%     t = mag(x1);
%     p = get_pwv(t);
%     
%     if p == 1
%         v = max(t);
%         r = 1 - t(1) / v;
%     else
%         r = 1 - t(p) / t(1);
%     end
% 
% figure(4);
% plot(s);
% 
% p
% r