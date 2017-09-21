clear all;
namelist = dir('*.txt');
len = length(namelist);
fid = fopen('G:\workspace\matlab\result14.csv', 'a+');
fid1 = fopen('G:\workspace\matlab\result15.csv', 'a+');
for j=1:len
    str = namelist(j).name;
    str
    y = textread(str, '', 'headerlines', 1);

    [c,l]=wavedec(y,8,'sym8'); 
    a8=appcoef(c,l,'sym8',8); 
    m = mean(a8);
    a8(:) = m;
    d8=detcoef(c,l,8); 
    d7=detcoef(c,l,7); 
    d6=detcoef(c,l,6); 
    d5=detcoef(c,l,5); 
    d4=detcoef(c,l,4); 
    d3=detcoef(c,l,3); 
    d2=detcoef(c,l,2); 
    d1=detcoef(c,l,1);
    c1 = [a8; d8; d7; d6; d5; d4; d3; d2; d1];
    s1 = waverec(c1, l, 'sym8');

    s1 = denwave(s1);
    s1 = s1;
    
    s = s1(4447:5000);
    plot(s);
    [start_point, end_point] = findstartpoint(s);
    
    fprintf(fid, '%s,', str);
    
    for i=1:length(start_point)
        fprintf(fid, '%d,', start_point(i));
    end
    
    fprintf(fid, '\t,');
    
    for i=1:length(end_point)
        fprintf(fid, '%d,', end_point(i));
    end
    
    fprintf(fid, 'ni\n');
    
    fprintf(fid1, '%s,%d\n', str, end_point(1));
    
end
fclose(fid);
fclose(fid1);