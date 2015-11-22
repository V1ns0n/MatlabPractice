function [ a ] = LinearEquations( G,d )
%LinearEquations Summary of this function goes here
%   Detailed explanation goes here
if G(1,1)==0
    temp=G(1,:);
    G(1,:)=G(2,:);
    G(2,:)=temp;
end
m=G(2,1)/G(1,1);
G(2,:)=G(2,:)-m*G(1,:);
d(2,1)=d(2,1)-m*d(1,1);
a(2,1)=d(2,1)/G(2,2);
a(1,1)=(d(1,1)-a(2,1)*G(1,2))/G(1,1);
end

