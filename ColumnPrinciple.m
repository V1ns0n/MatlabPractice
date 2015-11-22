function [ x,det ] = ColumnPrinciple( a,b )
%column principle Gaussian elimination 
%   author v1ns0n
A=a;
B=b;
n=length(B);
det=1;
for k=1:n-1
    max_value=max(abs(A(k:n,k)));
    if max_value==0
        det=0;
        x=0;
        return;
    end
    index=find(abs(A(:,k))==max_value);
    index=index(1);
    if index~=k
        A([k,index],:)=A([index,k],:);
        B([k,index])=B([index,k]);
        det=-det;
        disp(A);
        disp(B);
    end
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
        B(i)=B(i)-A(i,k)*B(k);
    end
    det=A(k,k)*det;
    disp(A);
    disp(B);
end
if A(n,n)==0
    det=0;
    x=0;
    return;
end
B(n)=B(n)/A(n,n);
for i=n-1:-1:1
    B(i)=(B(i)-sum(A(i,i+1:n).*B(i+1:n)'))/A(i,i);
end
det=A(n,n)*det; 
x=B;
end

