close all
clear
clc
load('stat.mat');
[o1,ave_jnd_eh] = excludeoutlier(con(:,8));
[o2,ave_jnd_bg] = excludeoutlier(lum(:,[5 6 7 8 10 11]));
con(:,4)=ave_jnd_eh;
lum(:,4)=ave_jnd_bg;
figure

% for i = [0.8,0.9,1.0,1.1,1.2]
%     ti = (lum(:,3)==i);
    x=lum(:,1);
    y=lum(:,2);
    z=ave_jnd_bg;
    
    [X,Y]=meshgrid(20:70:250,10:10:40);
    Z=griddata(x,y,z,X,Y);    
    surf(X,Y,Z);
    xlabel('Luminance'); 
    ylabel('E');
    zlabel('JND');   
    hold on
    plot3(x,y,z,'*');
% end

figure
% for i = [0.8,0.9,1.0,1.1,1.2]
%     ti = (con(:,3)==i);
    x=con(:,1);
    y=con(:,2);
    z=ave_jnd_eh;
    [X,Y]=meshgrid(0:20:60,10:10:40);
    Z=griddata(x,y,z,X,Y);
    surf(X,Y,Z);
    xlabel('C'); 
    ylabel('E');
    zlabel('JND');    
    hold on;
    plot3(x,y,z,'*');
% end