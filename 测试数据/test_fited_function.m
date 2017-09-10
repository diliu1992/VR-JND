% bg=1:256;
% e=5:40;
% [X,Y]=meshgrid(bg,e);
% JND=func_fjnd_bg(X,1536,Y);
% figure
% surf(bg,e,JND);
% figure
% jnd_lum_adapt = 0.000269*power(bg,2)-0.03652*bg+13.5;
% plot(bg,jnd_lum_adapt);

% bg-jnd
fitted_bgjnd = fitted_bgjnd(lum(:,1),lum(:,2),lum(:,3));
residual = lum(:,4)-fitted_bgjnd;
rmse_bg = sqrt(mean((residual).^2))
N = length(residual);
meanRatio =  mean(lum(:,4));
SSR = sum((fitted_bgjnd - meanRatio).^2);
SST = sum((lum(:,4) - meanRatio).^2);
RSquare_bg = SSR/SST
AdjRSquare_bg = 1 - (N - 1) * (1 - RSquare_bg) / (N - 3)
% eh-jnd
fitted_ehjnd = fitted_ehjnd(con(:,1),con(:,2),con(:,3));
residual = con(:,4)-fitted_ehjnd;
rmse_eh = sqrt(mean((residual).^2))
N = length(residual);
meanRatio =  mean(con(:,4));
SSR = sum((fitted_ehjnd - meanRatio).^2);
SST = sum((con(:,4) - meanRatio).^2);
RSquare_eh = SSR/SST
AdjRSquare_eh = 1 - (N - 1) * (1 - RSquare_eh) / (N - 3)



