clear all
clc

f = inline('exp(x) + x.^2 -2');
xi = -2:0.1:2;
y = f(xi);
plot(xi, y);
grid on;
a = input("Wprowadź a:");
b = input("Wprowadź b:");
eps = 0.001;


% Metoda połowienia
a1 = a;
b1 = b;
i = 0;
while (b1 - a1) > eps
    x = (a1 + b1) / 2;
    
    i = i + 1;

    if f(b1) * f(x) > 0
        b1 = x;
    else
        a1 = x;
    end
end

% od lewej strony -  w tym przypadku drugie rozwiązanie oba dobre
% while (b1 - a1) > eps
%     x = (a1 + b1) / 2;
%     
%     i = i + 1;
% 
%     if f(a1) * f(x) > 0
%         a1 = x;
%     else
%         b1 = x;
%     end
% end

x = (a1 + b1) / 2;
% disp(["Metoda bisekcji: ", x, "Ilość iteracji", i]);
fprintf('Metoda bisekcji: %f, Ilość iteracji = %d\n', x, i)

% Reguła Falsi skończyć

a1 = a;
b1 = b;
x0 = 0;
x1 = (a1*f(b1) - b1*f(a1)) / (f(b1) - f(a1));
i = 0;
while abs(x1 -x0) > eps
i = i + 1;

if(f(a1)*f(x1)) > 0
x2 = (x1*f(a1) - a1*f(x1)) / (f(a1) - f(x1));
a1 = x1;
elseif (f(b1)*f(x1)) > 0
x2 = (x1*f(b1) - b1*f(x1)) / (f(b1) - f(x1));
b1 = x1;
end

x0 = x1;
x1 = x2;
end
fprintf('Reguła Falsi: %f, Ilość iteracji = %d\n', x1, i);

% Metoda Newtona
a1 = a;
b1 = b;
i = 0;
h = 0.01;

% fp = pochodna
x0 = b1;
x1 = a1;
% x0 = a;
% wtedy zaczynamy od lewej nie od prawej, wyjdzie drugie rozwiązanie, oba
% dobre jak w przypadku metody bisekcji
% fp = (f(x0 + h) -f(x0 - h)) / (2*h);
% x1 = x0 - f(x0) / fp;

while abs(x1 - x0) > eps
    i = i + 1;
    x0 = x1;
    
    fp = (f(x0 + h) -f(x0 - h)) / (2*h);

    x1 = x0 - f(x0) / fp;
end

x = x1;
fprintf('Metoda Newtona: %f, Ilość iteracji = %d\n', x, i)

% Funkcja wbudowana
% lub a zamiast b , wyjdzie drugie rozwiązanie, oba dobre jak w przypadku metody bisekcji
xw = fzero('exp(x) + x.^2 -2', a);
fprintf('Funkcja wbudowana: %f\n', xw);
fprintf('Funkcja wbudowana: %f\n', fzero('exp(x) + x.^2 -2', b));