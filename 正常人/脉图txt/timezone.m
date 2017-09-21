function [h3, h4] = timezone(y, h1)
%TIMEZONE Summary of this function goes here
%   Detailed explanation goes here
N = length(y);
flag_M = floor(N * 0.8);
flag_N = floor(N * 0.4);

d = diff1(y);
in = 0;

for i=h1+1:flag_M
    if (d(i-1) > 0) && (d(i) < 0)
        in = in + 1;
        p(in) = i;
    end
end

if in >= 2
    h3 = p(1);
    h5 = p(2);
    f = 1;
    j = h5-1;
    while (f == 1)
      if (d(j-1) < 0) && (d(j) > 0)
          h4 = j;
          f = 0;
      else
        j = j - 1;
      end
    end
end


if in == 1
%     v = y(h1) - y(1);
%     v1 = y(p(1)) - y(1);
    if p(1) < flag_N
        h3 = p(1);
        h4 = geth4_new(y, h3+1, flag_M);
    else
        h5 = p(1);
        f = 1;
        j = h5-1;
        while (f == 1)
          if (d(j-1) < 0) && (d(j) > 0)
             h4 = j;
            f = 0;
          else
            j = j - 1;
          end
        end
        [h3, f] = geth3_new(y,h1+1, h4-1);
        if f == 0
            h3 = h4;
        end
    end
end

if (in == 0)
    h4 = geth4_new(y, flag_N, flag_M);
    [h3,f] = geth3_new(y, h1+1, flag_N);
    if f == 0
        h3 = h4;
    end
end

end

