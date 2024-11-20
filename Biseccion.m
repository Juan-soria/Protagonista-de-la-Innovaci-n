function Biseccion
%DR. SORIA QUIJAITE JUAN JESÚS
%CURSO: MÉTODOS NUMÉRICOS
%SOFTWARE MATLAB VERSIÓN 2020b
fprintf ('\n');
nombre_f=input('Ingeniero ingrese la función en estudio f(x)=','s');
a=input('Ingrese el límite inferior del Intervalo: ');
b=input('Ingrese el límite superior del Intervalo: ');
fprintf ('\n');
fprintf ('  it      a         b         aprox     error \n');
fprintf ('=================================================\n');
i=1;  e=1;  r=0;
while e>=3E-9 && i<=25
    va=r;
    r=(a+b)/2;
    x=a; fa=eval(nombre_f);
    x=b; fb=eval(nombre_f);
    x=r; fr=eval(nombre_f);
    fprintf ('%3.0f %10.6f %10.6f %10.6f',i,a,b,r);
    if fa*fr<=0
        b=r; e=abs((r-va)/r);
        fprintf('%10.6f\n',e);
    else
        a=r; e=abs((r-va)/r);
        fprintf('%10.6f\n',e);
    end
    i=i+1;
end
fprintf('\n');
fprintf ('=================================================\n');
fprintf('Ingeniero la raíz es :%10.9f\n',r);
