function [ output,average ] = excludeoutlier( origin )
%EXCLUDEOUTLIER 此处显示有关此函数的摘要
%   迭代去除矩阵origin中的outliers
%   output为输出的有效数据，m为有效数据的平均值
[m,n] = size(origin);
output =zeros(m,n);
average=zeros(m,1);
for i=1:m
    v = origin(i,:);
    while 1
        flag = (v~=0);
        ave = mean(v(v~=0));
        std1 = std(v(v~=0));
        temp = (abs(v-ave) <= 1.5*std1);
        temp = temp.*flag;
        v = v.*temp;
        if flag ==temp
            break
        end
    end
    output(i,:)=v;
    average(i,1)=mean(v(v~=0));
end
end

