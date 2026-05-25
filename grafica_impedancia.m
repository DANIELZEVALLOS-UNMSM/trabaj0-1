clc;
clear;
close all;

% Datos experimentales
f = [100 120 145 170 200 235 270 310 355 405 ...
    460 520 585 655 730 810 895 985 1080 1180 ...
    1290 1410 1540 1680 1830 1990 2160 2340 2530 2730];

Z = [152.3 149.1 146.8 144.9 142.0 139.5 137.9 136.1 134.8 133.6 ...
    132.7 131.9 131.4 131.1 130.9 131.0 131.3 131.9 132.7 133.8 ...
    135.2 136.9 138.9 141.1 143.5 146.1 149.0 152.2 155.6 159.2];

% Encontrar mínimo local
[Zmin, indice] = min(Z);
fmin = f(indice);

% Crear gráfica
figure;

plot(f, Z, 'o-b', 'LineWidth', 2, 'MarkerSize', 6);
hold on;

% Resaltar mínimo
plot(fmin, Zmin, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

% Texto del mínimo
text(fmin + 100, Zmin - 3, ...
    ['Mínimo local: ', num2str(fmin), ' Hz'], ...
    'Color', 'red', 'FontSize', 11);

% Títulos y etiquetas
title('Magnitud de impedancia |Z| en función de la frecuencia');
xlabel('Frecuencia f (Hz)');
ylabel('|Z| (\Omega)');

% Cuadrícula
grid on;

% Leyenda
legend('Datos experimentales', 'Mínimo local');

% Ajustar límites
xlim([0 3000]);
ylim([120 165]);

hold off;
