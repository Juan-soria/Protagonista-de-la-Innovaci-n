function newton2variables
%Curso Métodos numéricos
%Dr. Soria Quijaite Juan Jesús
clear, fprintf('\n')
dx=0.01;
dy=0.01;
x = input('Ingeniero ingres el valor inicial de xo=');
y = input('Ingeniero ingres el valor inicial de yo=');
fprintf (' it        x0            yo          F(x0)          F(y0) \n')
fprintf ('============================================================\n');
for n=1:50
   s=[x,y];
   xp=x+dx;
   yp=y+dy;
   J(1,1) = (f1(xp,y)-f1(x,y))/dx;
   J(1,2) = (f1(x,yp)-f1(x,y))/dy;
   J(2,1) = (f2(xp,y)-f2(x,y))/dx;
   J(2,2) = (f2(x,yp)-f2(x,y))/dy;
   F(1) = f1(x,y);
   F(2) = f2(x,y);
   ds=-J\F';
   x = x + ds(1);
   y = y + ds(2);   
  fprintf('n=%2.0f, x=%12.5e, y=%12.5e ',n,x,y)
    fprintf('F(1)=%10.2e, F(2)=%10.2e\n', F(1), F(2))
   if (abs(F(1)) < 1.0e-9 && abs(F(2)) < 1.0e-9)
      break 
   end
end
   fprintf ('===============================================================\n');
