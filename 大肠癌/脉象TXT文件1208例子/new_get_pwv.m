function [p, n, r] = new_get_pwv(p_arr, r_arr)
%NEW_GET_PWV Summary of this function goes here
%   Detailed explanation goes here
    N = length(p_arr);
    count = 0;
    for i=2:N
        if (abs(p_arr(i) - p_arr(i-1)) <= 2)
            count = count + 1;
        else
            count = 0;
        end 
        if (count == 15)
            break;
        end
    end
    
    if (i >= 15)
        for j=1:15
           p_d(j) = p_arr(i-15+j);
           r_d(j) = r_arr(i-15+j);
        end
    else
        for j=1:i
           p_d(j) = p_arr(j);
           r_d(j) = r_arr(j);
        end
    end
    
    [p, n, r] = get_majority(p_d, r_d);
    
end

