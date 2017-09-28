namelist = dir('*.txt');
len = length(namelist);
fid = fopen('G:\workspace\matlab\result_12.csv', 'a+');
for i=1:len
    str = namelist(i).name;
    str
    [t1, t3, t4, t5, h_1, h_3, h_4, h_5, tw] = time_data(str);
    fprintf(fid, '%s,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f\n', str, t1,t3,t4,t5,h_1,h_3,h_4,h_5,tw);
end
fclose(fid);