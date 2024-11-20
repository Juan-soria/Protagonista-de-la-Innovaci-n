#Códigos para Métodos numéricos
Script en R para los métodos númericos

Error absoluto y relativo de una funcion.

fv<-expression(exp(-x) + x - 2)
x<-1.85       # valor aproximado
Ex <- 0.3e-2  # su error absoluto
valor <- abs(eval(fv))
# Error absoluto
E.abs<- abs(eval(D(fv,"x")))*Ex
# Error relativo
E.rel <- E.abs/valor
margen.error <- E.rel*100

Error absoluto y relativo de una función f(x,y,z).

fv<-expression(sin(x^2) + sin(y^2) + sin(z^2))
x<-12.5 ; y<-14.82 ; z<-11.8
Ex <- 0.3e-2; Ey<-0.45e-1 ; Ez<-0.1e-2
valor <- abs(eval(fv))
# Error absoluto
E.abs<- abs(eval(D(fv,"x")))*Ex + abs(eval(D(fv,"y")))*Ey + abs(eval(D(fv,"z")))*Ez
# Error relativo
E.rel <- E.abs/valor
margen.error <- E.rel*100

Error relativo de la variancia de tres numeros.

x<-12.5 ; y<-14.82 ; z<-11.8
Ex <- 0.3e-2; Ey<-0.45e-1 ; Ez<-0.1e-2
fv<-expression((x^2 + y^2 + z^2- (x+y+z)^2/3)/2)
variancia <- eval(fv) ; var(c(x,y,z)) # equivalente
# Error absoluto
E.abs<- abs(eval(D(fv,"x")))*Ex + abs(eval(D(fv,"y")))*Ey + abs(eval(D(fv,"z")))*Ez
# Error relativo
E.rel <- E.abs/variancia
margen.error <- E.rel*100

Error relativo de la variancia de n datos.

# datos de rendimientos de camote, margen de error del 1% en los datos
library(agricolae)
data(sweetpotato)
x<-sweetpotato$yield
n<- length(x)
error <- 0.01*abs(x)
variancia <- var(x)
media <- mean(x)
E.abs <- sum(abs(2*x-2*sum(x)/n)*error)/(n-1)
E.rel <- E.abs/variancia
margen.error <- E.rel * 100 # resulta 4.35 % de margen de error.

Cifras significativas exactas.

fm<-function(x) {
  m<-log10(abs(x))
  if(m < 0) m<-trunc(m)-1
  else m<-trunc(m)
  return(m)
}

fa<-function(A,a) {
  Ea<-abs(A-a)
  m<-fm(A)
  k<-fm(Ea)
  if(trunc(Ea/10^k)<=5)v<-k+1
  else v<-k+2
  n<-m-v+1
  return(n)
}

# Ejemplo:
# X<- 12.5 es el valor exacto y las aproximaciones son 12.323, 12.673
fa(12.5, 12.323) # 2 cifras significativas exactas
fa(12.5, 12.5112) # 3 cifras significativas exactas

Solución de ecuaciones no lineales

Biseccion
# Remueve todos los objetos creados
rm(list=ls())
Fx <- function(x) exp(-x) + x -2

# Halla la raiz de Fx
biseccion <- function(a,b) {
  x<-seq(a,b,0.1)
  plot(x,Fx(x),type="l",col="blue")
  abline(h=0,col="blue")
  x<-b
  d<-(a+b)/2
  i<-0
  error<-abs(a-b)/2
  while (error > 1.e-4) {
    i<-i+1
    if (Fx(x) == 0) break
    if (Fx(x)*Fx(a) < 0) b <- x else {a <- x}
    d<-x
    x<-(a+b)/2
    #points(rbind(c(x,0)),pch=17,cex=0.7,col="red")
    text(x,0,i,cex=0.8,col="red")
    error<-abs(a-b)/2
    cat("X=",x,"\tE=",error,"\n")
  }
}
biseccion(-3,0)

Regula Falsi - Falsa posicion.
# Remueve todos los objetos creados
rm(list=ls())
Fx <- function(x) exp(-x) + x -2
F1x <- function(x) 1-exp(-x)
# Halla la raiz de Fx
regula <- function(a,b) {
  x<-seq(a,b,0.1)
  plot(x,Fx(x),type="l",col="blue")
  abline(h=0,col="blue")
  #x<-b
  #d<-(Fx(b)*a-Fx(a)*b)/(Fx(b)-Fx(a))
  error<-1
  while (error > 1.e-4) {
    x<-(Fx(b)*a-Fx(a)*b)/(Fx(b)-Fx(a))
    if (Fx(x) == 0) break
    if (Fx(x)*Fx(a) < 0) {b <- x}
    else {a <- x}
    error<-abs(Fx(x)/F1x(x))
    points(rbind(c(x,0)),pch=19,cex=0.7,col="red")
    cat("X=",x,"\t","E=",error,"\n")
  }
}
regula(0,3)

Secante
# Remueve todos los objetos creados
rm(list=ls())
Fx <- function(x) exp(-x) + x -2
F1x <- function(x) 1-exp(-x)
# Metodo de la Secante
# Halla la raiz de Fx

secante <- function(x0,x1) {
  x<-(Fx(x1)*x0-Fx(x0)*x1)/(Fx(x1)-Fx(x0))
  error <-1
  while (error > 1.e-4) {
    x0<-x1
    x1<-x
    x<-(Fx(x1)*x0-Fx(x0)*x1)/(Fx(x1)-Fx(x0))
    if (Fx(x) == 0) break
    error<-abs(Fx(x)/F1x(x))
    cat("X=",x,"\t","E=",error,"\n")
  }
}
secante(0,3)

Newton
# Remueve todos los objetos creados
rm(list=ls())
# Halla la raiz de Fx
Fx <- function(x) exp(-x) + x -2
F1x <- function(x) 1-exp(-x)

newton <- function(x) {
  for(i in 1:20) {
    x<-x-Fx(x)/F1x(x)
    if (Fx(x) == 0) break
    error<-abs(Fx(x)/F1x(x))
    cat("X=",x,"\t","E=",error,"\n")
  }
}
newton(1)

Solución de ecuaciones lineales

Construccion de la matriz LU de una matriz A de coeficientes

LU<-function(A) {
  n<-nrow(A)
  l<-rep(0,n^2)
  dim(l)<-c(n,n)
  u<-l
  for(k in 1:n) {
    for(j in k:n) {
      u[k,j]<-A[k,j]
      if(k > 1) {
        for (p in 1:(k-1)) {
          u[k,j]<-u[k,j]-l[k,p]*u[p,j]
        }
      }
    }
    for (i in k:n) {
      l[i,k]<-A[i,k]
      if (k > 1) {
        for (p in 1:(k-1)) {
          l[i,k]<-l[i,k]-l[i,p]*u[p,k]
        }
      }
      l[i,k]<-l[i,k]/u[k,k]
    }
  }
  return(list(L=l,U=u))
}

Raices y vectores caracteristicos

Método directo para hallar el vector y valor propio mas grande.
a <- cbind(c(5, -4, 1, 0),c(-4,6,-4,1),c(1,-4,6,-4),c(0,1,-4,5))
# valor inicial
x<-c(0,1,0,0)
lamda1 <-0
lamda <-max(a)
#Inicio del proceso iterativo
for (i in 1:5) {
  lamda1 <- lamda
  y <- a%*%x
  lamda <- max(y)
  x <- y/lamda
  print(lamda)
  z <- cbind(x,y)
  print(z)
}

# Cociente de rayleigh
ray <- t(x)%*%a%*%x/t(x)%*%x
print(ray)

Método de Jacobi
jacobi<-function(a,ciclos) {
  n<-nrow(a)
  id <- diag(x = 1, nrow=n, ncol=n )
  Q<-id
  for (k in 1:ciclos) {
    for ( i in 1:(n-1)) {
      for ( j in (i+1):n) {
        control <- 10^(-k)
        if( abs(a[i,j]) > control) {
          print(c(a[i,j],control))
          angulo <- 0.5*atan(2*a[i,j]/(a[i,i] - a[j,j]))
          c<-cos(angulo)
          s<-sin(angulo)
          p<-id
          p[i,i]<-c
          p[j,j]<-c
          p[i,j]<--s
          p[j,i]<- s
          Q <- Q%*%p
          a<-t(p)%*%a%*%p
          a[i,j]<-0
          a[j,i]<-0
        }
      }
    }
  }
  return(list(raices=diag(a),vectores=Q,estado=a))
}

# Aplicacion
A<-rbind(c(5, -2, 0),c(-2, 3,-1),c(0,-1,1))
jacobi(A,20)

Funciones incorporadas en R para hallar las raices y vectores
a <- cbind(c(5, -4, 1, 0),c(-4,6,-4,1),c(1,-4,6,-4),c(0,1,-4,5))
espectral <- eigen(a)
vectores <- as.matrix(espectral$vectors)
valores <- as.matrix(espectral$values)
print(a)
print(valores)
print(vectores)

Interpolacion, diferenciacion e integracion numerica.

# Diferencias finitas hacia adelante. diff.ad
x<- 0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.ad <-rep(NA,n*n)
dim(diff.ad)<-c(n,n)
diff.ad[,1]<-f
dimnames(diff.ad)<-list(0:(n-1),nombres)
for (j in 2:n) {
  for (i in 1:(n-j+1)) {
    diff.ad[i,j] <- diff.ad[i+1,j-1] - diff.ad[i,j-1]
  }
}
tabla<-as.matrix(data.frame(x=x,diff.ad))
print(tabla,na.print = "")

# Diferencias finitas hacia atras : diff.at.
x<- 0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.at <-rep(NA,n*n)
dim(diff.at)<-c(n,n)
diff.at[,1]<-f
dimnames(diff.at)<-list(0:(n-1),nombres)
for (j in 2:n) {
  for (i in n:(j)) {
    diff.at[i,j] <- diff.at[i,j-1] - diff.at[i-1,j-1]
  }
}
tabla<-as.matrix(data.frame(x=x,diff.at))
print(tabla,na.print = "")

Diferencias finitas centrales. diff.c
x<-0:8
f<-c(0,0,0,0,1,0,0,0,0)
n<-length(f)
x1<-rep(NA,2*n)
f1<-x1
for (i in seq(2,2*n,2)){
  x1[i-1]<-x[i/2]
  f1[i-1]<-f[i/2]
}
m<-2*n
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.c <-rep(NA,2*n*n)
dim(diff.c)<-c(2*n,n)
diff.c[,1]<-f1
xnames<-seq(0,n-0.5,0.5)
dimnames(diff.c)<-list(xnames,nombres)
for (j in 2:n) {
  for (i in j:(m-j+1)) {
    print(c(i,j))
    diff.c[i,j] <- diff.c[i+1,j-1] - diff.c[i-1,j-1]
  }
}
tabla<-as.matrix(data.frame(x=x1,diff.c))
print(tabla,na.print = "")

Diferencias divididas. diff.dv
x<-c(0,1,3,4,6,7)
f<-c(-5,1,25,55,181,289)
n<-length(f)
nombres<-c("f",paste("D",1:(n-1),sep="") )
diff.dv <-rep(NA,n*n)
dim(diff.dv)<-c(n,n)
diff.dv[,1]<-f
dimnames(diff.dv)<-list(0:(n-1),nombres)
for (j in 2:n) {
  for (i in 1:(n-j+1)) {
    k<-j+i-1
    print(c(i,j,k))
    diff.dv[i,j] <- (diff.dv[i+1,j-1] - diff.dv[i,j-1])/(x[k]-x[i])
  }
}
tabla<-as.matrix(data.frame(x=x,diff.dv))
print(tabla,na.print = "")

Expresiones para derivar e integrar
exp1<-expression(1+x+2*x^2)
exp2<-function(x) 1+x+2*x^2
D(exp1,"x")
# 1+2*(2*x)
integrate(exp2,0,4) # lower=0, upper=4
library(polynom)
p <- as.polynomial(c(1,0,3))
# p = 1+3*x^2
d1<-deriv(p)
# 6*x^2
integral(d1) # only polynomial
# 3*x^2 
# definite integral, only polynomial
integral(d1,c(0,4))
# 48

############### end #############
