% 2) Metoda cramera

% czyszczenie
clc
%

format long e;

A = input('Wprowadź macierz współczynników: ');
b = input('Wprowadź wektor pionowy wyrazów wolnych: ');

W = det(A);
for i=1:max(size(A))
    A1 = A;
    A1(:, i) = b;
    W1 = det(A1);
    x(i,1) = W1/W;
end
x

% to samo tylko mniej dokładne

% 3) x = A/b
x = A\b

% 4) x = A^(-1) * b
x1 = inv(A) * b
x = A^(-1) * b

% A = [1 -2 3 2; 2 3 -4 1; 1 2 1 1; 2 1 -1 1]
% B = [4;2;5;3]