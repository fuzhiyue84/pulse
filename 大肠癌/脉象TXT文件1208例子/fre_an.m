clear all;
% namelist = dir('*.txt');
% len = length(namelist);
% fid = fopen('G:\workspace\matlab\result2.csv', 'a+');
% for i=1:len
%     str = namelist(i).name;
%     [n, p, r, f] = pwv_data(str);
%     fr = 0.8 * 4 * f * n;
%     fprintf(fid, '%s,%d,%d,%.4f,%.4f\n', str, n, p, r,fr);
% end
% fclose(fid);

str = '20131102013 - ÷�ѻ� - ��.txt';
[n.p,r,f] = pwv_data(str);



