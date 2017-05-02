function [n_pwv, number, rf] = get_majority(arr, r_arr)
%GET_MAJORITY Summary of this function goes here
%   Detailed explanation goes here
n = length(arr);
test = zeros(1,10);
r_test = zeros(1,10);
for i=1:n
    if arr(i) == 1
        test(1) = test(1) + 1;
        r_test(1) =  r_test(1) + r_arr(i);
    end
    if arr(i) == 2
        test(2) = test(2) + 1;
        r_test(2) =  r_test(2) + r_arr(i);
    end
    if arr(i) == 3
        test(3) = test(3) + 1;
        r_test(3) =  r_test(3) + r_arr(i);
    end
    if arr(i) == 4
        test(4) = test(4) + 1;
        r_test(4) =  r_test(4) + r_arr(i);
    end
    if arr(i) == 5
        test(5) = test(5) + 1;
        r_test(5) =  r_test(5) + r_arr(i);
    end
    if arr(i) == 6
        test(6) = test(6) + 1;
        r_test(6) =  r_test(6) + r_arr(i);
    end
    if arr(i) == 7
        test(7) = test(7) + 1;
        r_test(7) =  r_test(7) + r_arr(i);
    end
    if arr(i) == 8
        test(8) = test(8) + 1;
        r_test(8) =  r_test(8) + r_arr(i);
    end
    if arr(i) == 9
        test(9) = test(9) + 1;
        r_test(9) =  r_test(9) + r_arr(i);
    end
    if arr(i) == 10
        test(10) = test(10) + 1;
        r_test(10) =  r_test(10) + r_arr(i);
    end
end
n_pwv = 1;
number = test(1);

for i=2:10
    if number < test(i)
        n_pwv = i;
        number = test(i);
    end
end

rf = r_test(n_pwv) / number;
end




