function [ x,y ] = Doolittle( a,b )
%Doolittle
%  author:v1ns0n
n=length(b);
u=zeros(n,n);
l=zeros(n,n);
x=zeros(n,1);
y=zeros(n,1);
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
y(1)=b(1);
for i=2:n
    y(i)=b(i)-sum(l(i,1:i-1)'.*y(1:i-1));
end
x(n)=y(n)/u(n,n);
for i=n-1:-1:1
    x(i)=(y(i)-sum(u(i,i+1:n)'.*x(i+1:n)))/u(i,i);
end
end

