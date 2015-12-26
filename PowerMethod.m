function [ x,u ] = PowerMethod( A,u0)
%PowerMethod Summary of this function goes here
%A method to get eigenvalue of the Matrix A 
v=A*u0;
x0=max(v);
u=v/x0;
k=1;
while 1
    v=A*u;
    x1=max(v);
    k=k+1;
    if abs(x1-x0)<0.0001
        break;
    end
    u=v/x1;
    x0=x1;
    fprintf('k=%d\nx=%f\n',k,x0);
    disp(u);
end
x=x1;
end

