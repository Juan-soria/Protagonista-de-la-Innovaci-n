%Ecuaciones diferenciales ordinarias
type lotka
t0 = 0;
tfinal = 15;
y0 = [20; 20];   
[t,y] = ode23(@lotka,[t0 tfinal],y0);


plot(t,y)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Predators','Location','North')


plot(y(:,1),y(:,2))
title('Phase Plane Plot')
xlabel('Prey Population')
ylabel('Predator Population')


[T,Y] = ode45(@lotka,[t0 tfinal],y0);

plot(y(:,1),y(:,2),'-',Y(:,1),Y(:,2),'-');
title('Phase Plane Plot')
legend('ode23','ode45')


%ECUACIONES DIFERENCIALES

[x , y] =dsolve('Dx=2*x+3*y ' , ' Dy=2*x+y ' )


[x , y] =dsolve('Dx=y ' , ' Dy=x ' )

%Solución de sistemas de ecuaciones diferenciales
[x , y] =dsolve('Dx=2*x+3*y' , ' Dy=2*x+y ' )





%método de Euler
x=[0,1/4,1/2,3/4,1,5/4,3/2,7/4,2,9/4,5/2,11/4,3];
y=[1,7/8,51/64,389/512,688/907,2001/2537,281/332,1097/1182,836/811,1372/1191,1101/854,703/488,1962/1223];
plot(x,y,'bo','LineWidth',3)  
hold on
x=0:0.05:3;
y=3*exp(-x/2)+x-2;
plot(x,y,'m','LineWidth',3)
grid on
xlabel('EJE DE ABSCISAS','Fontsize',15,'color','m')
ylabel('EJE DE ORDENADAS','Fontsize',15,'color','m')
title('MÉTODO DE EULER – Autónoma del Perú 2021','Fontsize',18,'color','b')
gtext('Aproximación Euler')
gtext('Solución general y=3*exp(-x/2)+x-2; ')

%Compilación de ecuaciones diferenciales por diferencias finitas
%findiff(p,q,r,a,b,alpha,beta,N)
findiff('p','q','r',0,1,0,5,4)

findiff(p,q,r,0,1,0,5,4)



A=[1 1]
B=[-2.5 -2.5 -2.5]
C=[1 1]
B=[0 0 -5]

trisys('A','D','C','B')



Vtc=[1 1]
vd=[-2.5 -2.5 -2.5]
Vta=[1 1]
Vb=[0 0 -5]

trisys('Vtc','vd','Vta','Vb')

findiff('p','q','r',0,1,0,5,4)
