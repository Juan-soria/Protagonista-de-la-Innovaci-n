%PROGRAMA DE INTERPOLACIÓN DE LAGRANGE 
%interpolaciónde LAGRANGE
function [C,L]=lagran(X,Y)      
w=length(X);
n=w-1;
L=zeros(w,w);
%formación de los polinomios de Lagrange
for k=1:n+1
   V=1;
   for j=1:n+1
      if k~=j
         V=conv(V,poly(X(j)))/(X(k)-X(j));
      end
   end
   L(k,:)=V;
end
%cálculo de los coeficientes del polinomio
%interpolador de Lagrange
C=Y*L;

