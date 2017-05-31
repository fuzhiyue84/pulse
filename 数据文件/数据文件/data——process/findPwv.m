function pm = findPwv(data)
%FINDPWV Summary of this function goes here
%   Detailed explanation goes here

if data(1) < data(2)
    pm = 1;
else
    for i=2:9
        if data(i-1) > data(i) && data(i) < data(i+1)
            break;
        end
    end
    pm = i;
    if pm == 9 && data(9) > data(10)
       pm = 10;
    end
end    

end

