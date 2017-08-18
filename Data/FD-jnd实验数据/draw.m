clear
clc
load('stat.mat');
[o,ave_jnd_eh] = excludeoutlier(contrast(:,5:10));
[o,ave_jnd_bg] = excludeoutlier(luminance(:,5:10));
figure
for i = [0.8,0.9,1.0,1.1,1.2]
    ti = (luminance(:,3)==i);
    x=luminance(ti,1);
    y=luminance(ti,2);
    z=ave_jnd_bg(ti);
    [X,Y]=meshgrid(20:70:240,10:10:40);
    Z=griddata(x,y,z,X,Y);    
    surf(X,Y,Z);
    xlabel('Luminance'); 
    ylabel('JOV');
    zlabel('JND');
    % plot3(x,y,z,'*');
    hold on
end

figure
for i = [0.8,0.9,1.0,1.1,1.2]
    ti = (contrast(:,3)==i);
    x=contrast(ti,1);
    y=contrast(ti,2);
    z=ave_jnd_eh(ti);
    [X,Y]=meshgrid(0:20:60,10:10:40);
    Z=griddata(x,y,z,X,Y);
    surf(X,Y,Z);
    xlabel('Contrast'); 
    ylabel('JOV');
    zlabel('JND');
    % plot3(x,y,z,'*');
    hold on
end