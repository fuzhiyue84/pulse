clear all;
fid = fopen('F:\sss.csv', 'r+');  
f1 = fopen('F:\result18.csv', 'r+'); 
fid2 = fopen('F:\result334.csv', 'a+');
m = textscan(fid,'%d %s', 'delimiter', ',');
mm = textscan(f1,'%s %d %d %f %f', 'delimiter', ',');
fclose(fid);
file_str = m{2};
num1 = m{1};

sp = mm{1};
num2 = mm{2};
num4 = mm{4};
num5 = mm{5};

len = length(file_str);

for i=1:len
    ss = file_str{i};
    ss
%     start_point = num1(i);
%     end_point = num2(i);
%     h1 = num3(i);
%     ss = file_str{i};
%     ss
%     y = textread(ss, '', 'headerlines', 1);
%     
%     [c,l]=wavedec(y,8,'sym8'); 
%     a8=appcoef(c,l,'sym8',8); 
%     m = mean(a8);
%     a8(:) = m;
%     d8=detcoef(c,l,8); 
%     d7=detcoef(c,l,7); 
%     d6=detcoef(c,l,6); 
%     d5=detcoef(c,l,5); 
%     d4=detcoef(c,l,4); 
%     d3=detcoef(c,l,3); 
%     d2=detcoef(c,l,2); 
%     d1=detcoef(c,l,1);
%     c1 = [a8; d8; d7; d6; d5; d4; d3; d2; d1];
%     s1 = waverec(c1, l, 'sym8');
%     s1 = denwave(s1);
%     s1 = s1;
%     
%     s = s1(4447:5000);
%     s2 = s(start_point:end_point);
    t = 0;
    nn = -1;
    nm = -1;
    for j = 1:length(sp)
        if length(findstr(ss, sp{j}))
            t = j;
            nn = num4(t);
            nm = num5(t);
        end 
    end
    fprintf(fid2, '%s,%d,%d,%.4f,%.4f\n', ss,num2(t),num1(i),nn,nm);
    
%     plot(s2);
    
%     y1 = h1 - start_point + 1
%     [h3, h4] = timezone(s2, y1)
%     print(gcf,'-dpng',[ss,'.png'])
end