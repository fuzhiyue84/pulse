function index = getdiff2(y, h1, n)
%GETDIFF2 Summary of this function goes here
%   Detailed explanation goes here
index = h1;
d = diff2(y);
s = 0;
for i = h1+1:n-1
    if (d(i-2) > 0) && (d(i-1) < 0) && (d(i-2) - d(i-1) > s)
        index = i;
        s = d(i-2) - d(i-1);
    end
end
end

