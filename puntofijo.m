function puntofijo
%Dr. Soria Quijaite Juan Jesús
%Curso métodos numéricos 
nombre_f=input(' Ingrese la función del punto fijo g(x)=','s');
x0=input(' ingrese el valor inicial xo= ');
fprintf ('\n');
fprintf (' it      aprox       g(x)      error \n');
fprintf ('=================================================\n');
i=1; e=1;
while e>=3E-6 && i<=18
x=x0;
r=eval(nombre_f);
e=abs((r-x0)/r);
fprintf ('%3.0f %10.6f %10.6f %10.6f\n',i,x0,r,e);
x0=r;
i=i+1;
end
fprintf('\n');
fprintf ('=================================================\n');
format long
fprintf('La raíz es :%10.9f\n',x0);
