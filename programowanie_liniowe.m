clc

% Zadanie 1
f = [2, 1.5, 3];
A = [4 6 15; 2 2 0; 5 3 4; 7 3 12];
B = [250; 60; 100; 220];
lb = [0; 0; 0];
x = linprog(f, -A, -B, [], [], lb, []);
x1 = ceil(x);
koszt = f * x1;
zawartosc = A * x1;
fprintf('Zadanie 1\n\tIlość kanapek: %d\n\tIlość pierogów: %d\n\tIlość słodyczy: %d\n\tKoszt: %f\n\tZawartość: białko - %d, tłuszcz - %d, witaminy - %d, węglowodany - %d\n', x1(1), x1(2), x1(3), koszt, zawartosc(1), zawartosc(2), zawartosc(3), zawartosc(4));

% Zadanie 2
f = [100, 200];
A = [5, 25; 0.5, 0; 100, 250; 10, 10];
B = [500; 15; 7500; 400];
x = linprog(-f, A, B, [], [], [], []);
zysk = f * x;
ilosc = A * x;
fprintf('\nZadanie 2\n\tIlość krzeseł: %.0f\n\tIlość krzeseł: %d\n\tZysk: %d\n\tIlość: drewno - %d, skóra - %.1f, klej - %d, nakład pracy - %d\n', x(1), x(2), zysk, ilosc(1), ilosc(2), ilosc(3), ilosc(4));
