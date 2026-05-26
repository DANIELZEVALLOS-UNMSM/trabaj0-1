clc;
clear;
close all;

% DATOS
f = [10 12.5 15 17.5 20 22.5 25 27.5 30 32.5 ...
     35 37.5 40 42.5 45 47.5 50 52.5 55 57.5 ...
     60 62.5 65 67.5 70 72.5 75 77.5 80 82.5 ...
     85 87.5 90 92.5 95 97.5 100 102.5 105 107.5];

V = [0.842 0.911 0.986 1.062 1.143 1.227 1.314 ...
     1.401 1.482 1.551 1.216 1.048 0.866 0.689 ...
     0.521 0.364 0.223 0.103 0.012 -0.041 -0.057 ...
     -0.034 0.018 0.096 0.197 0.318 0.452 0.579 ...
     0.700 0.809 0.611 0.688 0.756 0.811 0.856 ...
     0.894 0.926 0.954 0.980 1.004];

% ---------------------------------
% BUSQUEDA DE CAMBIO DE SIGNO
% ---------------------------------

for i = 1:length(V)-1
    
    if V(i)*V(i+1) < 0
        
        a = f(i);
        b = f(i+1);
        
        fprintf('Cambio de signo entre %.2f y %.2f kHz\n',a,b)
        
    end
end

% ---------------------------------
% METODO DE BISECCION
% PRIMERA RAIZ
% ---------------------------------

a = 55;
b = 57.5;

for k = 1:10
    
    c = (a+b)/2;
    
    fc = interp1(f,V,c,'linear');
    
    fa = interp1(f,V,a,'linear');
    
    if fa*fc < 0
        b = c;
    else
        a = c;
    end
end

raiz1 = c;

fprintf('\nPrimera raiz aproximada = %.4f kHz\n',raiz1)

% ---------------------------------
% SEGUNDA RAIZ
% ---------------------------------

a = 62.5;
b = 65;

for k = 1:10
    
    c = (a+b)/2;
    
    fc = interp1(f,V,c,'linear');
    
    fa = interp1(f,V,a,'linear');
    
    if fa*fc < 0
        b = c;
    else
        a = c;
    end
end

raiz2 = c;

fprintf('Segunda raiz aproximada = %.4f kHz\n',raiz2)

% ---------------------------------
% SPLINE CUBICO
% ---------------------------------

x = linspace(10,107.5,500);

Vspline = spline(f,V,x);

% ---------------------------------
% GRAFICA
% ---------------------------------

figure

plot(f,V,'bo','MarkerSize',6)
hold on

plot(x,Vspline,'r','LineWidth',2)

plot(raiz1,0,'ks','MarkerSize',10)

plot(raiz2,0,'md','MarkerSize',10)

yline(0,'k--')

grid on

title('Raices por Biseccion y Spline')
xlabel('Frecuencia (kHz)')
ylabel('Voltaje V(f)')

legend('Datos','Spline','Raiz 1','Raiz 2')
