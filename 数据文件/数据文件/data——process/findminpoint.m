function index = findminpoint(y)
%FINDMINPOINT Summary of this function goes here
%   Detailed explanation goes here
i = 1;
j = 1;
in = 1;
d_in = 0;
N = length(y);
d = diff1(y);
while (i <= N-1)
    while (d(i + j - 1) > 0)
        j = j + 1;
    end
    temp = y(i + j - 1) - y(i);
    if (temp > d_in)
        d_in = temp;
        in = i;
    end
    i = i + j;
    j = 1;
end
index = in;
end

