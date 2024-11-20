function secante
fprintf ('\n');
nombre_f=input(' Ingrese la función asociada f(x)=','s');
x0=input(' ingrese el 1er punto inicio x0= ');
x1=input(' ingrese el 2do punto inicio x1= ');
fprintf ('\n');
fprintf (' it     x0     x1     aprox       error \n')
fprintf ('=================================================\n');
i=1; e=1; r=0;
while e>=3E-6 && i<=18
va=r;
x=x0 ; fx0=eval(nombre_f);
x=x1 ; fx1=eval(nombre_f);
%r=x1-(x1-x0)*fx1/(fx1-fx0);
r=(x0.*fx1-x1.*fx0)./(fx1-fx0);
x=r; fr=eval(nombre_f);
fprintf ('%3.0f %10.6f %10.6f %10.6f',i,x0,x1,r);
if fx0*fr<=0
x1=r; e=abs((r-va)/r);
fprintf('%10.6f\n',e);
else
x0=r; e=abs((r-va)/r);
fprintf('%10.6f\n',e);
end
i=i+1;
end
fprintf ('=================================================\n');
format long
fprintf('La raíz es :%10.9f\n',r);
