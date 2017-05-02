function r = diff2(y)
%DIFF2 Summary of this function goes here
%   Detailed explanation goes here
N = length(y);
d1 = zeros(1, N);
for i=1:N-1
    d1(i) = y(i+1) - y(i);
end

r = zeros(1, N);
for i=1:N-2
    r(i) = d1(i+1) - d1(i);
end

