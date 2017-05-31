function p = checkpoint(y, n, points)
%CHECKPOINT Summary of this function goes here
%   Detailed explanation goes here
s = diff1(y);
m1 = 0;
m2 = 0;

N = length(points);
p = zeros(1, 2);
for i=1:N
    index = points(i);
    if index < floor(n / 3)
        if (y(index) > m1)
            p(1) = index;
            m1 = y(index);
        end
    end
    
    if index >= floor(n / 3) && index < floor(n / 3 * 2)
        if (y(index) > m2)
            p(2) = index;
            m2 = y(index);
        end
    end
end

end

