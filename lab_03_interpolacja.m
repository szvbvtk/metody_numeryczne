% http://www.geol.agh.edu.pl/~mpapiez/MN/zajecia5.html

% A = polyfit(X, Y, n)
% w = polyval(A, x)

clc

% Podpunkt 1

% xi = input("Wprowadź wektor współrzędnych węzłów x: ");
% yi = input("Wprowadź wektor współrzędnych węzłów x: ");

% V =macierz vandermonde'a

xi = [-2, -1, 0, 2,4];
yi = [-1,0,5,99,-55];

% Podpunkt 2

%n = size(xi, 2)
n = length(xi);

V = zeros(n);

V(:, 1) = 1;
for i = 1 : n
    for j =  2: n
        V(i, j) = xi(i).^(j - 1);
    end
end
V;
Y = yi';
% V * A = Y
% A = inv(V) * Y;
A = V \ yi';

A = A(end: -1 :1)'

% Podpunkt 3

x= xi(2);


wx = zeros([1, length(xi)]);

for i = 1 : length(xi)
    w = 0;
    for j = 1 : length(A)
        w = w + A(j) * xi(i)^(j-1);
    end
    wx(i) = w;
end

wx
plot(xi, yi, 'o')
hold on
x = (min(xi):0.1:max(xi));
y = zeros(length(x), 1)';

% abcdef = A(1) * (-2)^4 + A(2) * (-2)^3 + A(3) * (-2)^2 + A(4) * (-2)^1 + A(5)
for k = 1:length(x)
    for l = 1:length(A)-1
        y(k) = y(k) + A(l) * x(k)^(length(A) - l);
    end
    y(k) = y(k) + A(length(A));
end

y;



wielomianStr = "";
for k = 1:length(A)-1
    wielomianStr = wielomianStr + string(A(k)) + '*x^' + string(length(A) - k) + ' + ';
end
wielomianStr = wielomianStr + string(A(length(A)))

wielomianStr

plot(x, y)
title(wielomianStr)


