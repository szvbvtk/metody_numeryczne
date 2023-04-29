clear
clc

xi = [-2, -1, 0, 2,4];
yi = [-1,0,5,99,-55];
format default


plot(xi, yi, 'o');
hold on;

p = 4;
% dla 4 jest to aproksymacja bo jest 5 węzłów czyli wielomian 4 stopnia

PSI = zeros(p+1, p+1);
F = zeros(1, p+1);

for j = 1 : length(xi)
    for i = 1 : p + 1
        for k = 1 : p + 1
            PSIt(i, k) = xi(j) ^ (i + k - 2);
        end
    end
    PSI = PSI + PSIt;
    for l = 1 : p + 1
        Ft(l) = yi(j) * xi(j) ^ (l - 1);
    end
    F = F + Ft;

end

A = inv(PSI) * F';
A = A(end: -1 :1)'

x = (min(xi):0.1:max(xi));
y = zeros(length(x), 1)';

for k = 1:length(x)
    for l = 1:length(A)-1
        y(k) = y(k) + A(l) * x(k)^(length(A) - l);
    end
    y(k) = y(k) + A(length(A));
end

plot(x, y, 'r');
title("Aproksymacja");
