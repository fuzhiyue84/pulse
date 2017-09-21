function [h3, f] = geth3_new(y, start, pend)
%GETH3_NEW Summary of this function goes here
%   Detailed explanation goes here
d = diff1(y);
dd = -1;
f = 0;
h3 = 0;
while (dd > -35)
    flag = 0;
    temp = 0;
    for i=start:pend
        if (d(i-1) < dd) && (d(i) > dd)
            flag = 1;
        end
        if (flag == 1) && (d(i-1) > dd) && (d(i) < dd)
            temp = i;
            flag = 2;
            break;
        end
    end
    if (flag == 2)
        h3 = temp;
        f = 1;
        break;
    else
        dd = dd - 1;
    end
end

end

