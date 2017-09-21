function [s_point, e_point] = findstartpoint(y)
%FINDSTARTPOINT Summary of this function goes here
%   Detailed explanation goes here

N = length(y);
d = diff1(y);

i = 1;
index = 1;

while (i < N)
    j = 1;
    while (d(i+j-1) > 0)
        j = j + 1;
    end
    if (j > 20)
       start_point(index) = i;
       end_point(index) = i + j - 1;
       index = index + 1;
    end
    i = i + j;
end

index = index - 1;
flag = zeros(1, index);
for i=1:index-1
    if (abs(start_point(i) - start_point(i+1)) < 100)
        if (flag(i) == 0) && (flag(i+1) == 0)
            e1 = abs(y(end_point(i)) - y(start_point(i)));
            e2 = abs(y(end_point(i+1)) - y(start_point(i+1)));
            if e1 > e2
                flag(i) = 0;
                flag(i+1) = 1;
            else
                flag(i) = 1;
                flag(i+1) = 0;
            end
        else
            flag(i+1) = 0;
        end
    else
        if flag(i) == 0
            flag(i) = 0;
        end
    end
end

in = 1;
for i=1:index
    if flag(i) == 0
        s_point(in) = start_point(i);
        e_point(in) = end_point(i);
        in = in + 1;
    end
end

if in == 1
    s_point(in) = 0;
    e_point(in) = 0;
end

end

