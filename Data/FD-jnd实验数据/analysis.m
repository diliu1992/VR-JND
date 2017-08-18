dep = contrast(:,3);
jnd = contrast(:,4);
x = [0.8,0.9,1,1.1,1.2];

for i=1:5
    y(i) = mean(jnd(find(dep==x(i))));
end