function[theta]=Metodomontecarlo(k)
%Aproxima por el metodo de monte Carlo a la ecuacion cov(U.^2,sqrt(1-U^2))
clc
k=100;
U1=rand(1,k);
Z1=U1.^2;
theta1=sum(U1.^2)/k
U2=rand(1,k);
Z2=sqrt(1-U2.^2);
theta2=sum(Z2)/k
theta3=theta1*theta2
Z3=Z1.*Z2;
theta4=sum(Z3)/k
theta=theta4-theta3