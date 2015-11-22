%Script file: chap9_4
%Euler Method
h=0.5;
x0=0;
y0=0;
x1=0;
while x1<2
    x1=x0+h;
    y1=y0+h*(exp((x0^2)));
    fprintf('x=%f y=%12.9f\n',x1,y1);
    x0=x1;
    y0=y1;
end
