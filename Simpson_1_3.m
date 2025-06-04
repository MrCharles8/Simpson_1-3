clc; clear; close all;

% Definir función original f(x)
f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;

% Intervalo de integración
a = 0;
b = 0.8;

% Valor exacto (calculado analíticamente o conocido)
valor_real = 1.640533;

% Número de segmentos
n = 2;
h = (b - a) / n;

% Puntos a, a+h, b
x0 = a;
x1 = a + h;
x2 = b;

% Evaluación de la función en los puntos
fa = f(x0);
fm = f(x1);
fb = f(x2);

% Regla de Simpson 1/3 con dos segmentos
I_aprox = (h/3) * (fa + 4*fm + fb);

% Derivada cuarta de f(x)
syms x
f4_sym = diff(0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5, x, 4);
f4_fun = matlabFunction(f4_sym);

% Valor medio de la cuarta derivada
media_f4 = integral(f4_fun, a, b) / (b - a);

% Error de truncamiento estimado (Simpson 1/3)
E_t = -((b - a)^5 / (180 * n^4)) * media_f4;

% Error relativo porcentual
error_rel_porcentual = abs((valor_real - I_aprox) / valor_real) * 100;

% Mostrar resultados
fprintf('=== Simpson 1/3 con n = %d ===\n', n);
fprintf('Integral aproximada      : %.6f\n', I_aprox);
fprintf('Media de f''''(x)         : %.6f\n', media_f4);
fprintf('Error de truncamiento    : %.6f\n', E_t);
fprintf('Error relativo porcentual: %.4f%%\n', error_rel_porcentual);