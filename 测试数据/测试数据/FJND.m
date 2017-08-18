%% FJND
close all
clear
clc
bg=1:25:256;
v=1536;
e=0:2:20;
bg_fjnd=zeros(11,11);
for i=1:1:11
    for j=1:1:11
        bg_fjnd(i,j) = func_fjnd_bg(bg(i),v,e(j));
    end
end
figure 
mesh(e,bg,bg_fjnd);
xlabel('Eccentricity');
ylabel('Luminance'); 
zlabel('JND');
ylim([1 256]);
zlim([0 25]);
%eh_fjnd = func_fjnd_eh(bg,eh,v,e);
figure
eh = 15:15:60;
e = 3:3:18;
eh_fjnd=zeros(6,4);
for i=1:1:4
    for j=1:1:6
        eh_fjnd(j,i) = func_fjnd_eh(128,eh(i),v,e(j));
    end
end
mesh(eh,e,eh_fjnd);
xlabel('Contrast');
ylabel('Eccentricity');
zlabel('JND');