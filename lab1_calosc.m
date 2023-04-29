% 1) Metoda gaussa-jordana
format default
A = input('Wprowadź macierz współczynników: ');
b = input('Wprowadź wektor pionowy wyrazów wolnych: ');

n = size(b, 1);
x = zeros(n, 1);
Ab = [A b];

for i = 1 : n
    Ab(i, :) = Ab(i, :) ./ Ab(i,i);
    for j = 1 : n
        if i ~= j
            Ab(j, :) = Ab(j, :) - Ab(i, :) * Ab(j,i);
        end
    end
end
fprintf("Gauss-jordan")
x = Ab(:, n+1)


% 2) Metoda cramera

% czyszczenie
% clc
%

format long e;

W = det(A);
for i=1:max(size(A))
    A1 = A;
    A1(:, i) = b;
    W1 = det(A1);
    x(i,1) = W1/W;
end

fprintf("Cramer")
x

% to samo tylko mniej dokładne

% 3) x = A/b
fprintf("x = A/b")
x = A\b

% 4) x = A^(-1) * b
%x1 = inv(A) * b
fprintf("A^(-1) * b")
x = A^(-1) * b

% A = [1 -2 3 2; 2 3 -4 1; 1 2 1 1; 2 1 -1 1]
% B = [4;2;5;3]