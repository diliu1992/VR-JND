function fjnd_eh = func_fjnd_eh(eh,e)
fjnd_eh = func_spatial_contrast(eh).*f2(e);
end

%% Spatial contrast of SJND
function jnd_spat_cont = func_spatial_contrast(eh)
% f1 from the free energy
% jnd_spat_cont = (0.01 * bg + 11.5) * (0.01 * eh -1) -12;

% f1 from the SJND
% MIU         = 0.5;
% alpha_bg    = bg .* 0.0001 + 0.115;
% beta_bg     = MIU - bg.* 0.01;
% jnd_spat_cont   = eh .* alpha_bg + beta_bg;
jnd_spat_cont = 0.0008437*power(eh,2)+0.007625*eh+13.85;
end

%% Multiplier for eh of SJND
function fact_cont_fov = f2(e)
fact_cont_fov = 0.08*e+13.3;
end
function fact_cont_fov = f3(d)
fact_cont_fov = 18.76*d-3.517;
end
function fact_cont_fov = func_factor_cont_fov(eh, v, e)
fact_cont_fov = power(func_W_cont_fov(v,e), func_I_cont_fov(eh));
end

function W_cont_fov = func_W_cont_fov(v,e)
W_cont_fov = (1 + 0.05) ./ (func_fm(v, e) / func_fm(v, 0) + 0.05);
end

function fm = func_fm(v, e)
fm = min(2.3*log(64)/0.106./(2.3+e), pi*v/360);
end

function I_cont_fov = func_I_cont_fov(eh)
I_cont_fov = power(log(eh/255+1)-1.5,2)-0.66;
end