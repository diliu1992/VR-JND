close all
clear
clc
load('stat.mat');
[o1,ave_jnd_eh] = excludeoutlier(con(:,8));
[o2,ave_jnd_bg] = excludeoutlier(lum(:,[5 6 7 8 10 11]));
con(:,4)=ave_jnd_eh;
lum(:,4)=ave_jnd_bg;
%fitting bg 
mean_bg_jnd_bg = zeros(4,1);
mean_bg_jnd_e = zeros(4,1);
mean_bg_jnd_depth = zeros(5,1);
bg = 20:70:230;bg=bg';
e = 10:10:40;e=e';                   
depth = 0.8:0.1:1.2;depth=depth';
for i=1:4
    mean_bg_jnd_bg(i) = mean(lum(lum(:,1)==20+ 70*(i-1),4));
    mean_bg_jnd_e(i) = mean(lum(lum(:,2)==10+ 10*(i-1),4));
    mean_bg_jnd_depth(i) = mean(lum(lum(:,3)==0.8+ 0.1*(i-1),4));
end
mean_bg_jnd_depth(5) = mean(lum(lum(:,3)==1.2,4));
%fitting eh
mean_eh_jnd_eh = zeros(4,1);
mean_eh_jnd_e = zeros(4,1);
mean_eh_jnd_depth = zeros(5,1);
eh = 0:20:60;eh=eh';
e = 10:10:40;e=e';                   
depth = 0.8:0.1:1.2;depth=depth';
for i=1:4
    mean_eh_jnd_eh(i) = mean(con(con(:,1)==0+ 20*(i-1),4));
    mean_eh_jnd_e(i) = mean(con(con(:,2)==10+ 10*(i-1),4));
    mean_eh_jnd_depth(i) = mean(con(con(:,3)==0.8+ 0.1*(i-1),4));
end
mean_eh_jnd_depth(5) = mean(con(con(:,3)==1.2,4));
% for i = [0.8,0.9,1.0,1.1,1.2]
%     ti = (lum(:,3)==i);

%drawing
figure 
    x=lum(:,1);
    y=lum(:,2);
    z=ave_jnd_bg;
    
    [X,Y]=meshgrid(20:70:250,10:10:40);
    Z=griddata(x,y,z,X,Y);    
    surf(X,Y,Z);
    xlabel('Luminance'); 
    ylabel('Eccentricity');
    zlabel('JND');   
    hold on
    plot3(x,y,z,'*');
% end
figure
    x=lum(:,1);
    y=lum(:,3);
    z=ave_jnd_bg;
    
    [X,Y]=meshgrid(20:70:250,0.8:0.1:1.2);
    Z=griddata(x,y,z,X,Y);    
    surf(X,Y,Z);
    xlabel('Luminance'); 
    ylabel('Depth');
    zlabel('JND');   
    hold on
    plot3(x,y,z,'*');
figure
% for i = [0.8,0.9,1.0,1.1,1.2]
%     ti = (con(:,3)==i);
    x=con(:,1);
    y=con(:,2);
    z=ave_jnd_eh;
    [X,Y]=meshgrid(0:20:60,10:10:40);
    Z=griddata(x,y,z,X,Y);
    surf(X,Y,Z);
    xlabel('Contrast'); 
    ylabel('Eccentricity');
    zlabel('JND');    
    hold on;
    plot3(x,y,z,'*');
% end
figure
% for i = [0.8,0.9,1.0,1.1,1.2]
%     ti = (con(:,3)==i);
    x=con(:,1);
    y=con(:,3);
    z=ave_jnd_eh;
    [X,Y]=meshgrid(0:20:60,0.8:0.1:1.2);
    Z=griddata(x,y,z,X,Y);
    surf(X,Y,Z);
    xlabel('Contrast'); 
    ylabel('Depth');
    zlabel('JND');    
    hold on;
    plot3(x,y,z,'*');