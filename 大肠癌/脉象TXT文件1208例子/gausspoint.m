function x = gausspoint(y)
%GAUSSPOINT Summary of this function goes here
%   Detailed explanation goes here
N = length(y);
t = 1:N;

n = rand(1, 10) * 90;
grad = zeros(1, 10);
grd = zeros(1, 10);
c = 0.00001;
step = 0.0002;
n1 = zeros(1, 10);
for i=1:400000
    for j=1:10
        n1(j) = n(j) - 0.9 * grd(j);
    end
    
    for j=1:10
       m = zeros(1, 10);
       m(:) = n1;
       m(j) = n1(j) + c;
       
       delta1 = error(n1, y);
       delta2 = error(m, y);
       
       grad(j) = (delta2 - delta1) / c * step;
       grad(j) = grad(j) + 0.9 * grd(j);
    end
    
    delta1 = error(n, y)
    
    for j=1:10
        v = 3^(1 - i/50000);
        n(j) = n(j) - grad(j);
    end
    
    grd(:) = grad;
end
x = n;
end

