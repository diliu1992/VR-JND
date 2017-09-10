close all
clear
clc
load('stat.mat');
[o1,ave_jnd_eh] = excludeoutlier(con(:,8));
[o2,ave_jnd_bg] = excludeoutlier(lum(:,[5 6 7 8 10 11]));
con(:,4)=ave_jnd_eh;
lum(:,4)=ave_jnd_bg;
figure

%观测值
jnd_eh = con(:,4);
eh = con(:,1);
bg = 200*ones(80,1);
e = con(:,2);
depth = con(:,3);
%fjnd
v = 1536;
fjnd_eh = func_fjnd_eh(depth,e);
AVG_Ratio = jnd_eh./fjnd_eh;

%cftool;

% x = Sf, y = Nmg
%((1+a)./(x+a))^((log(y + 1)+ b)^2 + c)

%[a b c] =  lsqcurvefit(F, [0 0 0], [Sf Nmg], AVG_Ratio);

%function F = myfun(p, data)
%     F = @(p, data)((1+p(1))./(data(:,1)+p(1))).^((log(data(:,2) + 1)+ p(2)).^2 + p(3));
 F = @(p, data)(p(1)*data(:,1)+p(2));
%end

%拟合系数
N = length(AVG_Ratio);
[p SSE residual]=  lsqcurvefit(F, [0 0], eh, AVG_Ratio);

p
SSE


%RMSE ,RSquare, AdjSquare 的计算结果貌似有些问题
%计算RMSE
rmse = sqrt( SSE / N)  

%计算R square
predictedRatio = AVG_Ratio + residual;
meanRatio =  mean(AVG_Ratio);
SSR = sum((predictedRatio - meanRatio).^2);
SST = sum((AVG_Ratio - meanRatio).^2);
RSquare = SSR/SST
AdjRSquare = 1 - (N - 1) * (1 - RSquare) / (N - 3)


%cftool;

% X = [0 : 0.01 : 1];
% 
% figure(1);
% Y = (1+p(1))./(X+p(1));
% plot(X,Y);
% 
% 
% figure(2);
% Y = (log(X + 1)+ p(2)).^2 + p(3);
% plot(X,Y);
