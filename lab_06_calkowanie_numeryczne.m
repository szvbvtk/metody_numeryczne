clc;
% 1

f = inline('x.^(cos(x))');
a = 0;
b = 10;

n = 10;
h= (b - a)/n;
x = a:h:b;
% 2


% a Metoda prostokątów
y = f(x);

J1 = h * (sum(y) -f(b))


% b Metoda trapezów

x_2 = a+h:h:b;
y_2 = f(x_2);

J2 = h * (f(a)/2 + sum(y_2) - f(b) + f(b)/2)
% c Metoda Simpsona (parabol)

x_np = a+2*h:2*h:b-2*h;
x_p = a+h:2*h:b-h;
y_np = f(x_np);
y_p = f(x_p);
J3 = (h/3) * (f(a) + 4 * sum(y_p) + 2 * sum(y_np) + f(b))
% d Metoda wbudowana
J4 = quad('x.^(cos(x))', a, b)

% e Metoda Monte Carlo
f = inline('x.^(cos(x))');
a = 0;
b = 10;

xi = a:0.1:b;
yi = f(xi);

ymax = max(yi);
N = 5000;
plot(xi, yi);
hold on;

x = a + (b - a) * rand(1, N);
y = ymax * rand(1, N);
n_traf = 0;



for i = 1:N
    if y(i) < f(x(i))
        n_traf = n_traf + 1;
        plot(x(i), y(i), 'og')
    else
        plot(x(i), y(i), 'xr')
    end
end

% line([a, b], [ymax ymax]);
% to samo 
yline(ymax, "Color", "#0072BD");

J5 = (n_traf / N) * (b - a) * ymax

