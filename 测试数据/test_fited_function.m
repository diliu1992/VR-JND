% bg=1:256;
% e=5:40;
% [X,Y]=meshgrid(bg,e);
% JND=func_fjnd_bg(X,1536,Y);
% figure
% surf(bg,e,JND);
% figure
% jnd_lum_adapt = 0.000269*power(bg,2)-0.03652*bg+13.5;
% plot(bg,jnd_lum_adapt);

fitted_jnd = fitted_vrjnd(lum(:,1),lum(:,2),lum(:,3));
residual = lum(:,4)-fitted_jnd;
rmse = sqrt(mean((residual).^2))
N = length(residual);
meanRatio =  mean(lum(:,4));
SSR = sum((fitted_jnd - meanRatio).^2);
SST = sum((lum(:,4) - meanRatio).^2);
RSquare = SSR/SST
AdjRSquare = 1 - (N - 1) * (1 - RSquare) / (N - 3)





