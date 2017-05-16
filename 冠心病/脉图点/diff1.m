function d = diff1(y)
%DIFF1 Summary of this function goes here
%   Detailed explanation goes here
N = length(y);
d = zeros(1, N);
for i=1:N-1
    d(i) = y(i+1) - y(i);
end
end

