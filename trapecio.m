function trapecio
f=input('Ingrese la función a integrar f(x)=','s');
a=input('Ingrese el límite inferior=');
b=input('Ingrese el límite superior=');
n=input('Ingrese el valor de M=');
xmin=a-1; 
xmax=b+1;
h=(b-a)/n;
x=a:h:b;
fx=eval(f);
y=abs(fx);
A=y(1)+y(n+1);
B=2*sum(y(2:n));
integral=(h/2)*(A+B);
fprintf('El área es: %10.9f\n',integral);
%GRÁFICA DE LA INTEGRAL 
xp=xmin:0.2:xmax;
x=xp;
yp=eval(f);
plot(xp,yp,'b');
hold on
x=a:0.05:b;
y=eval(f);
bar(x,y,'r');
xlabel('EJE X')
ylabel('EJE Y')
title('Área bajo la curva')
grid on
