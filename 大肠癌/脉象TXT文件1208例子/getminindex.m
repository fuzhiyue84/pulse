function minindex = getminindex(y)
N = length(y);
delta = zeros(1, N);
minindex = 0;
for i=1:N-1
    delta(i) = y(i+1) - y(i);
end
for i=1:N
    b = true;
    for j=1:25
        if (delta(i + j - 1) > 0)
            b = true;
        else
            b = false;
            break;
        end
    end
    if (b == true)
        minindex = i;
        break;
    end
end
end

