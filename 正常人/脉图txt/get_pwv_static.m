function [n, n_arr] = get_pwv_static(arr)
%GET_PWV_STATIC Summary of this function goes here
%   Detailed explanation goes here

n = length(arr);
test = zeros(1,10);
for i=1:n
    if arr(i) == 1
        test(1) = test(1) + 1;
    end
    if arr(i) == 2
        test(2) = test(2) + 1;
    end
    if arr(i) == 3
        test(3) = test(3) + 1;
    end
    if arr(i) == 4
        test(4) = test(4) + 1;
    end
    if arr(i) == 5
        test(5) = test(5) + 1;
    end
    if arr(i) == 6
        test(6) = test(6) + 1;
    end
    if arr(i) == 7
        test(7) = test(7) + 1;
    end
    if arr(i) == 8
        test(8) = test(8) + 1;
    end
    if arr(i) == 9
        test(9) = test(9) + 1;
    end
    if arr(i) == 10
        test(10) = test(10) + 1;
    end
end

num = 0;
for i=1:10
    if (test(i) ~= 0)
        num = num + 1;
        n(num) = i;
        n_arr(num) = test(i);
    end
end

end

