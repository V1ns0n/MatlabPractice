%Script file: chap9_2_1.m   
%y:Improved Euler Method
%z:Trapezium Method
%e:Exactly Rusult
h=0.1;
x0=0;
x1=0;
y0=0;
z0=0;
e1=0;
while x1<0.5
    x1=x0+h;
    %Euler
    y1=(1-h+0.5*(h^2))*y0+0.5*h*((1-h)*x0*(1+x0)+(1+x1)*x1);
    %Trapezium 
    z1=(2-h)/(2+h)*z0+h/(2+h)*(x0*(1+x0)+x1*(1+x1));
    %Exactly
    e1=-(exp(1)^(-x1))+x1^2-x1+1;
    %Error
    error_y=abs(y1-e1);
    error_z=abs(z1-e1);
    %Result
    fprintf('x=%f y=%12.9f error_y=%e z=%12.9f error_z=%e\n',x1,y1,error_y,z1,error_z);
    x0=x0+h;
    y0=y1;
    z0=z1;
end


