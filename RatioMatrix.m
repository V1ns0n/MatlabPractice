function [ G,d ] = RatioMatrix( x,y,exp )
%RatioMatrix Summary of this function goes here
%   Detailed explanation goes here
G(1,1)=InnerProduct(x.^0,x.^0);
G(1,2)=InnerProduct(x.^0,x.^exp);
G(2,1)=G(1,2);
G(2,2)=InnerProduct(x.^exp,x.^exp);
d(1,1)=InnerProduct(x.^0,y);
d(2,1)=InnerProduct(x.^exp,y);
end

