clear all
namelist = dir('*.txt');
len = length(namelist);
for i=1:len
    str = namelist(i).name;
    [t1, t3, t4, h_1, h_3, h_4] = get_time_data(str);
    fprintf(fid, '%s,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n', str,t1,t3,t4,h_1,h_3,h_4);
end




