function s = denwave(y)
%DENWAVE Summary of this function goes here
%   Detailed explanation goes here
minx = min(y);
maxx = max(y);
s = y - minx;
maxx = maxx - minx;
s = s / maxx * 10;
s = wden(s, 'heursure', 's', 'one', 3, 'bior3.5');

s = s * maxx / 10;
s = s + minx;
end

