clc
clear

f = inline("x.^3 + x.^2 - 20*x");
a = 0;
b = 6;


% Metoda złotego podziału

eps = 0.01;

ilosc_iteracji = 0;
while b - a > eps

    x2 = a + 0.618*(b - a);
    x1 = a + 0.382*(b - a);


    if f(x1) < f(x2)
        b = x2;
    else
        a = x1;
    end
    ilosc_iteracji = ilosc_iteracji + 1;

end


xmin = (a + b) / 2;
ilosc_iteracji;

fprintf("Metoda złotego podziału: %f, ilość iteracji: %d\n\n", xmin, ilosc_iteracji);


% Metoda połowienia (bieskcji, dwudzielna)
ilosc_iteracji = 0;
a = 0;
b = 6;


while b - a > eps
    L = b-a;

    x2= a+ 0.75*L;
    x1=a + 0.25*L;

    xm = (a + b) / 2;

    if f(xm) > f(x1)
        b = xm;
    elseif f(xm) < f(x2)
        a = x1;
        b = x2;
    else
        a = xm;
    end

    ilosc_iteracji = ilosc_iteracji + 1;  
end

xmin = (a+b)/2;
ilosc_iteracji;

fprintf("Metoda połowienia: %f, ilość iteracji: %d\n\n", xmin, ilosc_iteracji);

% Metooda Newtona
a = 0;
b = 6;

ilosc_iteracji = 0;

xk = a;
h = 0.01;

pochodna1 = (f(xk+h) - f(xk-h)) / (2 * h);
pochodna2 = (f(xk+h) - 2*f(xk) + f(xk-h)) / h^2;

xk1 = xk - pochodna1 / pochodna2;
while abs(xk1 - xk) > eps

    xk = xk1;
    
    pochodna1 = (f(xk+h) - f(xk-h)) / (2 * h);
    pochodna2 = (f(xk+h) - 2*f(xk) + f(xk-h)) / h^2;

    xk1 = xk - pochodna1 / pochodna2;

    ilosc_iteracji = ilosc_iteracji + 1;
end
xk1;

fprintf("Metoda Newtona: %f, ilość iteracji: %d\n\n", xk1, ilosc_iteracji);

% 2.2701
% Metoda wbudowana
a = 0;
b = 6;
xmin = fminbnd("x.^3 + x.^2 - 20*x", a, b);

fprintf("Metoda wbudowana: %f\n", xmin);