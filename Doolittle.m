function [ x ] = Doolittle( a,b )
%Doolittle
%  author:v1ns0n
n=length(b);
u=zeros(n,n);
l=zeros(n,n);
u(1,1)=a(1,1);
for i=2:n
    u(1,i)=a(1,i);
    l(i,1)=a(i,1)/u(1,1);
    disp(u);
    disp(l);
end
for r=2:n
    u(r,r)=a(r,r)-sum(l(r,1:r-1)'.*u(1:r-1,r));
    for i=r+1:n
        if r~=n
            u(r,i)=a(r,i)-sum(l(r,1:r-1)'.*u(1:r-1,i));
            l(i,r)=(a(i,r)-sum(l(i,1:r-1)'.*u(1:r-1,r)))/u(r,r);
            disp(u);
            disp(l);
        end
    end
end
disp(u);
disp(l);
x=0;
end

