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

% Malla para graficar
x = linspace(min(f),max(f),1000);

% Polinomios
p5 = polyfit(f,Z,5);
p10 = polyfit(f,Z,10);
p15 = polyfit(f,Z,15);
p29 = polyfit(f,Z,29);

% Evaluacion
y5 = polyval(p5,x);
y10 = polyval(p10,x);
y15 = polyval(p15,x);
y29 = polyval(p29,x);

% Grafica
figure

plot(f,Z,'ko','MarkerFaceColor','k')
hold on

plot(x,y5,'b','LineWidth',1.5)
plot(x,y10,'g','LineWidth',1.5)
plot(x,y15,'m','LineWidth',1.5)
plot(x,y29,'r','LineWidth',1.5)

title('Interpolacion Polinomica')
xlabel('Frecuencia (Hz)')
ylabel('|Z| (Ohm)')

legend('Datos','Grado 5','Grado 10','Grado 15','Grado 29')
grid on

% Interpolacion en 1000 Hz
Z1000 = polyval(p10,1000);

fprintf('Z(1000 Hz) = %.4f Ohm\n',Z1000);

% Leave-One-Out
rng(1)

idx = randperm(length(f),5);

errores = zeros(1,5);

for i = 1:5

    f2 = f;
    Z2 = Z;

    freal = f2(idx(i));
    Zreal = Z2(idx(i));

    f2(idx(i)) = [];
    Z2(idx(i)) = [];

    p = polyfit(f2,Z2,10);

    Zest = polyval(p,freal);

    errores(i) = abs((Zreal-Zest)/Zreal)*100;

end

error_prom = mean(errores);

fprintf('Error relativo promedio = %.4f %%\n',error_prom);
