clear all;
fid = fopen('G:\workspace\matlab\result22.csv', 'r+');  
f1 = fopen('G:\workspace\matlab\result2.csv', 'r+'); 
fid2 = fopen('G:\workspace\matlab\result26.csv', 'a+');
m = textscan(fid,'%s %f %f %f %f %f %f %f %f %f', 'delimiter', ',');
mm = textscan(f1,'%s %d %d %f %f %d', 'delimiter', ',');
fclose(fid);
file_str = m{1};
num1 = m{2};
num2 = m{3};
num3 = m{4};

sp = mm{1};
s_n = mm{6};

len = length(sp);

for i=1:len
    ss = sp{i};
    nn = s_n(i);
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
    for j = 1:size(file_str,1)
        if length(findstr(ss, file_str{j}))
            t = j;
        end 
    end
    fprintf(fid2, '%s,%d\n', ss,t);
    
%     plot(s2);
    
%     y1 = h1 - start_point + 1
%     [h3, h4] = timezone(s2, y1)
%     print(gcf,'-dpng',[ss,'.png'])
end