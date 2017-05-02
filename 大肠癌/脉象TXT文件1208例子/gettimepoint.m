function [h1, h3, h5, h4] = gettimepoint(y)
%GETTIMEPOINT Summary of this function goes here
%   Detailed explanation goes here
d = diff1(y);
N = length(y);
h1 = 1;
h3 = 1;
h5 = 1;
h4 = 1;
while (d(h1) > 0)
    h1 = h1 + 1;
end

N
n = floor(2 * N / 3);
num = 0;

points(1) = 0;
for i=h1+1:n-1
    if (d(i-1) > 0) && (d(i) < 0)
        num = num + 1;
        points(num) = i;
    end
end

points
pointx = zeros(1, 2);
if num >= 2
    p = checkpoint(y, N, points);
    if p(1) == 0
        pointx(1) = p(2);
        num = 1;
    else if p(2) == 0
            pointx(1) = p(1);
            num = 1;
        else
            num = 2;
            pointx(1) = p(1);
            pointx(2) = p(2);
        end
    end
end

if num == 1
    pointx(1) = points(1);
end

if num == 2
    h3 = pointx(1);
    h5 = pointx(2);
    h4 = geth4(h5, d);
else 
    if num == 1
        if pointx(1) < floor(N / 3)
            h3 = pointx(1);
            h5 = getdiff2(y, floor(N/3), floor(N/3*2));
            h4 = geth4_2(h5, y);
        else
            h5 = pointx(1);
            h4 = geth4(h5, d);
            h3 = getdiff2(y, h1, floor(N/3));
            if h3 == h1
                h3 = h4;
            end
        end
    end
    if num == 0
        h5 = getdiff2(y, floor(N/3), floor(N/3*2));
        h4 = geth4_2(h5, y);
        h3 = getdiff2(y, h1, floor(N/3));
        if h3 == h1
            h3 = h4;
        end
    end
end

end

