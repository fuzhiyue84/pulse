function delta = error(n, s)
%ERROR Summary of this function goes here
%   Detailed explanation goes here

N = length(s);
t = 1:N;

delta = 0;
y = normpdf(t, n(1), n(2)) * n(3) + normpdf(t, n(4), n(5)) * n(6) + normpdf(t, n(7), n(8)) * n(9) + n(10);

for i=1:N
    if ((i < 5) || (i > 140))
        delta =  delta + (y(i) - s(i)) * (y(i) - s(i)) * 0;
    else
        delta =  delta + (y(i) - s(i)) * (y(i) - s(i));
    end
    
end

end

