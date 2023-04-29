% F(x) = x^(cosx)

% 1
f = inline('x.^cos(x)');

% 2
x = 0:0.1:10;
y = f(x)
plot(x, y);
hold on;



% 3
% Pochodna analitycznie
% ln f(x) = cosx * lnx
% f'(x) = (-sinx * lnx + cosx * 1/x) * x^cosx lub
% f'(x) = (cosx/x - sinx*lnx) ^ x^cosx

% lub toolbox symbolic

syms x
f = sqrt(2*x);
d = inline(diff(f));
x = 0:0.1:10;
y23 = d(2)
plot(x, y)

% 3
% wzór 2 punktowy:
h = 0.2;
f = inline('x.^cos(x)');

fp = (f(x + h) - f(x)) / h;
plot(x, fp);

% wzór 3 punktowy 
fp = (f(x+h) - f(x-h)) / (2 * h);
plot(x, fp);

% wzór 5 punktowy
fp = (f(x-2*h) - 8 * f(x-h) + 8 * f(x+h) - f(x+2*h)) / (12 * h);
plot(x, fp);

legend('x\^cosx', 'Pochodna analitycznie', 'Wzór 2 punktowy', 'Wzór 3 punktowy', 'Wzór 5 punktowy');

