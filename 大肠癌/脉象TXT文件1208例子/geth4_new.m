function [h4] = geth4_new(y, start, pend)
%GETH4_NEW Summary of this function goes here
%   Detailed explanation goes here
d = diff1(y);
dd = -1;
while (dd > -35)
    flag = 0;
    temp = 0;
    for i=start:pend
        if (d(i-1) < dd) && (d(i) > dd)
            flag = 1;
            temp = i;
        end
        if (flag == 1) && (d(i-1) > dd) && (d(i) < dd)
            flag = 2;
            break;
        end
    end
    if (flag == 2)
        h4 = temp;
        break;
    else
        dd = dd - 1;
    end
end

dd
end

