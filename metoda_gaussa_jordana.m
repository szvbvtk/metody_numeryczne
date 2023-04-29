format default
% 1) Metoda gaussa-jordana
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
x = Ab(:, n+1)
