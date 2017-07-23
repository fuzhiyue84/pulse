clear all;
namelist = dir('*.txt');
len = length(namelist);
fid = fopen('G:\result3.csv', 'a+');
for i=1:len
    str = namelist(i).name;
    [n, p, r, f, n_r, num_r] = pwv_data(str);
    fr = 0.8 * 4 * f * n;
    fprintf(fid, '%s,%d,%d,%.4f,%.4f\n', str, n, p, r,fr);
    n_r
    num_r
end
fclose(fid);

