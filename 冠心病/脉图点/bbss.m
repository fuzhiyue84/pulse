clear all

str = '20060628002.txt';
y = textread(str, '', 'headerlines', 1);

% [c,l]=wavedec(y,8,'sym8'); 
% a8=appcoef(c,l,'sym8',8); 
% m = mean(a8);
% a8(:) = m;
% d8=detcoef(c,l,8); 
% d7=detcoef(c,l,7); 
% d6=detcoef(c,l,6); 
% d5=detcoef(c,l,5); 
% d4=detcoef(c,l,4); 
% d3=detcoef(c,l,3); 
% d2=detcoef(c,l,2); 
% d1=detcoef(c,l,1);
% c1 = [a8; d8; d7; d6; d5; d4; d3; d2; d1];
% s1 = waverec(c1, l, 'sym8');

figure(1);
plot(y);
[p, n, rf, f] = pwv_data(str);