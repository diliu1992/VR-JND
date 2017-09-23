function fitted_ehjnd = fitted_ehjnd(eh,e,depth)
fitted_ehjnd= (0.000367*power(eh,2)-0.009281*eh+10.34).*(0.1666*e+6.813).*(0.0827*depth+0.0084);
end


