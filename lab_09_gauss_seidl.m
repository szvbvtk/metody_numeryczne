clc

f = inline('2*x.^2 + y.^2 + x.*y-6*x - 5*y + 8');

v = -5:0.1:5;
[x,y] = meshgrid(v);
z = f(x, y);

contour(x, y, z, 50);

% wykres 3d
% mesh(x,y,z);

xk = -4;
yk = 4;
eps = 0.001;
hold on;
while true
    xk1 = xk;
    yk1 = yk;

    a = -5;
    b = 5;
    while b - a > eps
    
        x2 = a + 0.618*(b - a);
        x1 = a + 0.382*(b - a);
    
    
        if f(x1, yk) < f(x2, yk)
            b = x2;
        else
            a = x1;
        end

    end
    xk = (a + b) / 2;

    plot([xk xk1], [yk yk])
    
    a = -5;
    b = 5;
    while b - a > eps
    
        y2 = a + 0.618*(b - a);
        y1 = a + 0.382*(b - a);
    
    
        if f(xk, y1) < f(xk, y2)
            b = y2;
        else
            a = y1;
        end
    end

    yk = (a + b) / 2;
   
    plot([xk xk], [yk yk1])
    
    if sqrt((xk1 - xk).^2 + (yk1 - yk).^2) < eps
        break
    end
end

fprintf("\nMinimum funkcji dwóch fmiennych metodą Gauss Seidl\n\tx=%f\n\ty=%f\n", xk, yk);

% Funkcja wbudowana
x0 = [-4, -4];
f = inline('2*x(1).^2 + x(2).^2 + x(1)*x(2)-6*x(1) - 5*x(2) + 8');
x = fminsearch(f, x0);
fprintf("\nMinimum funkcji dwóch fmiennych metodą wbudowaną\n\tx=%f\n\ty=%f\n", x(1), x(2));
% x