function fitted_bgjnd = fitted_bgjnd(bg,e,depth)
fitted_bgjnd= (0.000269*power(bg,2)-0.03652*bg+13.5).*(0.037*power(e,1.5)+9.65).*(1.1639*depth+0.54)/25;
end

