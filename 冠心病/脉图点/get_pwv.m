function p = get_pwv(y)
%GET_PWV Summary of this function goes here
%   Detailed explanation goes here
if y(1) < y(2)
    p = 1;
else
    p = 10;
    for i=2:9
        if y(i-1) > y(i) && y(i) < y(i+1)
            p = i;
            break;
        end
    end
end

end

