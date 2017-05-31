function s = sortnum(c)
%SORTNUM Summary of this function goes here
%   Detailed explanation goes here

N = length(c);

n = zeros(1, N);
m = zeros(1, N);

for i=1:N
    n(i) = i;
end

for i=1:N-1
    for j=i+1:N
        if c(i) > c(j)
            temp = n(j);
            n(j) = n(i);
            n(i) = temp;
        end
    end
end

for i=1:N
    m(n(i)) = i-1;
end

for i=1:N;
    if m(i) == floor(N / 2)
        s = c(i);
    end
end

end

