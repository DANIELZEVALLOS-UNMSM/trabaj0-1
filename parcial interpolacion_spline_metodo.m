clc;
clear;
close all;

% DATOS
f = [37.5 40.0 42.5];
V = [1.048 0.866 0.689];

% PUNTO A INTERPOLAR
x = 41;

% INTERPOLACION DE LAGRANGE
L1 = ((x-f(2))*(x-f(3))) / ((f(1)-f(2))*(f(1)-f(3)));
L2 = ((x-f(1))*(x-f(3))) / ((f(2)-f(1))*(f(2)-f(3)));
L3 = ((x-f(1))*(x-f(2))) / ((f(3)-f(1))*(f(3)-f(2)));

V41 = V(1)*L1 + V(2)*L2 + V(3)*L3;

% GRAFICA
xx = linspace(37.5,42.5,100);

yy = V(1)*((xx-f(2)).*(xx-f(3))) / ((f(1)-f(2))*(f(1)-f(3))) ...
    + V(2)*((xx-f(1)).*(xx-f(3))) / ((f(2)-f(1))*(f(2)-f(3))) ...
    + V(3)*((xx-f(1)).*(xx-f(2))) / ((f(3)-f(1))*(f(3)-f(2)));

figure

plot(f,V,'ro','MarkerSize',8)
hold on

plot(xx,yy,'b','LineWidth',2)

plot(x,V41,'ks','MarkerSize',10)

grid on

title('Interpolacion de Lagrange')
xlabel('Frecuencia (kHz)')
ylabel('Voltaje V')

legend('Datos','Polinomio','V(41)')
