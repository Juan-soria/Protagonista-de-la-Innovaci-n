function newton_orden1
nombre_f=input(' Ingrese la función asociada f(x)= ','s');
x0=input(' ingrese el valor inicial : ');
fprintf ('\n');
fprintf (' it   aprox   f(x) error \n');
fprintf ('=================================================\n');
i=1; e=1; delta=0.001;
while e>=3E-12 && i<=18
x=x0;
fx0=eval(nombre_f);
x=x0-delta;
df1=eval(nombre_f);
x=x0+delta;
df2=eval(nombre_f);
dfx0=(df2-df1)/(2*delta);
r=x0-(fx0/dfx0);
e=abs((r-x0)/r);
fprintf ('%3.0f %10.6f %10.6f %10.6f\n',i,x0,r,e);
x0=r;
i=i+1;
end
fprintf ('=================================================\n');
fprintf('La raíz es :%10.9f\n',x0);
