function h = geth4_2(h5, y)
%GETH4_2 Summary of this function goes here
%   Detailed explanation goes here
d2 = diff2(y);
h = h5 - 1;
sum = 0;
while sum < 1 && h > 1
    sum = sum + d2(h-1);
    h = h - 1;
end
if h == 1
    h = h5;
end
end

