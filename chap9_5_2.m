%Script file:chap9_5_2
%R-K 4 Method
h=0.2;
x0=0;
x1=0;
y0=1;
while x1<1;
    x1=x0+h;
    k1=3*y0/(1+x0);
    k2=3*(y0+0.5*h*k1)/(1+x0+0.5*h);
    k3=3*(y0+0.5*h*k2)/(1+x0+0.5*h);
    k4=3*(y0+h*k3)/(1+x0+h);
    y1=y0+1/6*h*(k1+2*k2+2*k3+k4);
    fprintf('x=%f,y=%12.9f\n',x1,y1);
    x0=x1;
    y0=y1;
end