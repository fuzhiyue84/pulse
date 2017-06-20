clear all;
namelist = dir('*.txt');
len = length(namelist);
fid = fopen('F:\pwv_2.csv', 'a+');
fprintf(fid, 'name,n_min,number,rf,pwv\n');
for i=1:len
    str = namelist(i).name;
    str
    [n, p, r, f] = pwv_data(str);
    fr = 0.8 * 4 * f * n;
    fprintf(fid, '%s,%d,%d,%.4f,%.4f\n', str, n, p, r, fr);
end
fclose(fid);



