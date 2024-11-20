%Curso: Métodos numéricos
%Programa: Diferencias Divididas de Newton
%Docente: Dr. Soria Quijaite Juan
function interponewton
fprintf('\n')
x = input('ingrese los valores de x=');
y = input('ingrese los valores de y=');
n=length(x);
D=zeros(n,n);
D(:,1)=y';
for j=2:n
    for k=j:n;
        %RESULTADOS DE TABLA DE DIFERENCIAS DIVIDIDAS
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(x(k)-x(k-j+1))
    end
end
c=D(n,n);
for k=(n-1):-1:1
    c=conv(c,poly(x(k)));
    m=length(c);
    %CÁLCULO DE COEFICIENTES DEL POLINOMIO DE NEWTON REDUCIDOS
    c(m)=c(m)+D(k,k)
    format rat
end