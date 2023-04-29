clear

x = 0:0.5:3;
y = sin(x.^2)
xi = 0:0.01:3;
yi = interp1(x, y, xi, "linear")
yi2 = sin(xi.^2)

subplot(2,2, 1)
plot(x, y, 'o', xi, yi,'k', xi, yi2)
axis([0 3 -1 1.5])
title("Linear")

yi = interp1(x, y, xi, "spline")
subplot(2,2, 2)
plot(x, y, 'o', xi, yi,'k', xi, yi2)
axis([0 3 -1 1.5])
title("Spline")

yi = interp1(x, y, xi, "cubic")
subplot(2,2, 3)
plot(x, y, 'o', xi, yi, 'k', xi, yi2)
axis([0 3 -1 1.5])
title("Cubic")

subplot(2,2, 4)
A = polyfit(x, y, 6)
W = polyval(A, xi)
plot(x, y, 'o', xi, W, 'k', xi, yi2)
axis([0 3 -1 1.5])
title("Polynominal")




% ylim([1, -1.3])