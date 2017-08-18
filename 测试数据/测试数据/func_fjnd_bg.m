function fjnd_bg = func_fjnd_bg(bg,v,e)
fjnd_bg = func_luminance_adaption(bg).*func_factor_lum_fov(bg, v, e);
return
%% Luminance adaption of SJND
function jnd_lum_adapt =  func_luminance_adaption(bg)
T0 = 14;
gamma = 3 / 128;
jnd_lum_adapt = (T0 * (1 - sqrt((256-bg) / 128))+2).*(bg >= 128) + (gamma * (-bg + 128) + 2).*(bg < 128);
return
%% Multiplier for bg of SJND
function fact_lum_fov = func_factor_lum_fov(bg, v, e)
fact_lum_fov = func_W_lum_fov(v,e).^func_I_lum_fov(bg);
return
function W_lum_fov = func_W_lum_fov(v,e)
gamma =1;
W_lum_fov = 1 + ((1 - func_fm(v, e)) ./ func_fm(v, 0)).^gamma;
return

function fm = func_fm(v, e)
fm = min(2.3*log(64)/0.106./(2.3+e), pi*v/360);
return

function I_lum_fov = func_I_lum_fov(bg)
I_lum_fov = 0.05+exp(-power(log2(bg+1)-7, 2)/2/0.8/0.8)/sqrt(2*pi)/0.8;
return





