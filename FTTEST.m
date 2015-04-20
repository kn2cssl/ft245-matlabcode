clc
close all;
x=0;
databuff(100)=0;
instrreset;
s=serial ( 'COM7' , 'BaudRate' ,19200 , 'DataBits' , 8 , 'Timeout' , 10 );
set ( s ,'Terminator', 90 );
fopen(s);
axis ([-10 3000  0 5000])
for n=1:1:5000
data3 = fread(s,1);
 if (data3 == 90)
  data1 = fread(s,1);   
  data2 = fread(s,1);
  if data2>=128  
     %data(n)=-(~(dec2bin(typecast(int16((data2*256)+data1),'uint16')))+1);
     x = dec2bin((data2*256)+data1,16);
     y = (~(x)+1);
     data(n)=- bi2de(y);
      
  else
      data(n)=((data2*256)+data1); 
  end
  data(n)

  hold on;
  plot(n,data(n),'r');
 end
 %pause(10);
end
fclose(s)
figure (3);
plot(data);
hold off;
% x=1:1:1000;
% plot(x,data)    