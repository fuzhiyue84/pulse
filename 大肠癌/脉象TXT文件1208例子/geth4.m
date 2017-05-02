function h = geth4(h5, d)
%GETH4 Summary of this function goes here
%   Detailed explanation goes here
h = h5 - 1;
while d(h-1) > 0 && d(h) > 0
    h = h - 1;
end
end

