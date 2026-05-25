clc;
clear;
close all;

% Datos
f = [100 120 145 170 200 235 270 310 355 405 460 520 585 655 ...
    730 810 895 985 1080 1180 1290 1410 1540 1680 1830 ...
    1990 2160 2340 2530 2730];

Z = [152.3 149.1 146.8 144.9 142.0 139.5 137.9 136.1 134.8 ...
    133.6 132.7 131.9 131.4 131.1 130.9 131.0 131.3 131.9 ...
    132.7 133.8 135.2 136.9 138.9 141.1 143.5 146.1 149.0 ...
    152.2 155.6 159.2];

% Spline cubico
pp = spline(f,Z);

% Malla fina
x = linspace(min(f),max(f),1000);

% Evaluar spline
y = ppval(pp,x);

% Primera derivada
d1 = gradient(y,x);

% Segunda derivada
d2 = gradient(d1,x);

% Buscar minimo
[~,i] = min(abs(d1));

fmin = x(i);
d2min = d2(i);

% Grafica de derivada
figure

plot(x,d1,'b','LineWidth',1.5)
hold on

plot(fmin,0,'ro')

title('Derivada d|Z|/df')
xlabel('Frecuencia (Hz)')
ylabel('d|Z|/df')

grid on

% Resultados
fprintf('Frecuencia del minimo = %.4f Hz\n',fmin);

fprintf('Segunda derivada = %.4f\n',d2min);

if d2min > 0
    fprintf('El minimo es estable\n');
else
    fprintf('El minimo no es estable\n');
end
