function fre = get_first_fre(y)
%GET_FIRST_FRE Summary of this function goes here
%   Detailed explanation goes here
hz = mean(y, 2);
fre = 1 / (hz / 200);

end