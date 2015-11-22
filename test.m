x0=0;
x1=-2-1/3*x0^2-1/12*x0^3;
e=abs(x1-x0);
while e>0.5e-10
    x1=-2-1/3*x0^2-1/12*x0^3;
    e=abs(x1-x0);
    x0=x1;
end
fprintf('x=%12.10f\n',x1);