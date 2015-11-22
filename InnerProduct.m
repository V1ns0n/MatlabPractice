function [ inner_product ] = InnerProduct( x,y )
%Inner Product Summary of this function goes here
%   Detailed explanation goes here
data_size=length(x);
temp=x.*y;
inner_product=0;
for ii = 1:data_size
    inner_product=inner_product+temp(ii);
end
end

