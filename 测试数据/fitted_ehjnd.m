function fitted_ehjnd = fitted_ehjnd(eh,e,depth)
fitted_ehjnd= (0.0008437*power(eh,2)+0.007625*eh+13.85).*(0.08*e+13.3).*(0.0817*depth-0.0164);
end


