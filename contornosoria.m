function contornosoria
%Curso:Ecuaciones diferenciales 
%Docente: Dr. Soria Quijaite Juan Jesús 
%Universidad: Autónoma del Perú 
x1=-4:0.05:4;
y1=-4:0.05:4;
[x,y]=meshgrid(x1,y1);
f1=y.^4+16*y+x.^4-8*x.^2-17;
contour(x,y,f1,[0.00 0.00],'r')
 hold on
f2=y.^4+16*y+x.^4-8*x.^2-27;
f3=y.^4+16*y+x.^4-8*x.^2-37;
f4=y.^4+16*y+x.^4-8*x.^2-47;
f5=y.^4+16*y+x.^4-8*x.^2-57;
f6=y.^4+16*y+x.^4-8*x.^2-67;
f7=y.^4+16*y+x.^4-8*x.^2-77;
f8=y.^4+16*y+x.^4-8*x.^2+27;
f9=y.^4+16*y+x.^4-8*x.^2+22;
f10=y.^4+16*y+x.^4-8*x.^2+17;
f11=y.^4+16*y+x.^4-8*x.^2+12;
f12=y.^4+16*y+x.^4-8*x.^2+7;
f13=y.^4+16*y+x.^4-8*x.^2+1;
contour(x,y,f2,[0.00 0.00],'r','LineWidth',3)
contour(x,y,f3,[0.00 0.00],'r','LineWidth',3)
contour(x,y,f4,[0.00 0.00],'b','LineWidth',3)
contour(x,y,f5,[0.00 0.00],'b','LineWidth',3)
contour(x,y,f6,[0.00 0.00],'b','LineWidth',3)
contour(x,y,f7,[0.00 0.00],'b','LineWidth',3)
contour(x,y,f8,[0.00 0.00],'b','LineWidth',3)
contour(x,y,f9,[0.00 0.00],'m','LineWidth',3)
contour(x,y,f10,[0.00 0.00],'c','LineWidth',3)
contour(x,y,f11,[0.00 0.00],'y','LineWidth',3)
contour(x,y,f12,[0.00 0.00],'k','LineWidth',3)
contour(x,y,f13,[0.00 0.00],'g','LineWidth',3)
xlabel('EJE DE ABSCISAS','Fontsize',15,'color','m')
ylabel('EJE DE ORDENADAS','Fontsize',15,'color','m')
title('COMPARACIÓN EULER Y RUNGE KUTTA 4 - UPEU 2023','Fontsize',18,'color','b')
grid on 
gtext('f(x;y)=y.^4+16*y+x.^4-8*x.^2-C')
hold off
