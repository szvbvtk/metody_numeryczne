clc
f = inline('2*x.^2 + y.^2 + x.*y-6*x - 5*y + 8');
h = 0.01;
alfa = 0.01;
eps = 0.01;


hold on;
v = -5:0.1:5;
[x,y] = meshgrid(v);
z = f(x, y);
contour(x, y, z, 50);

x0 = -5;
y0 = -5;
p0 = [x0, y0]; % wektor ze współrzednymi miejsca startowego

dx=(f(x0 + h,y0)-f(x0 - h,y0))/(2*h);
dy=(f(x0,y0 + h)-f(x0,y0 - h))/(2*h);
grad=[dx,dy];


while(norm(grad) > eps)
    
  dx=(f(x0+h,y0)-f(x0-h,y0))/(2*h);
  dy=(f(x0,y0+h)-f(x0,y0-h))/(2*h);
  grad=[dx,dy];

  x1 = p0 - (grad/norm(grad)) * alfa;
  p0 = x1;
  x0 = p0(1);
  y0 = p0(2);

  plot(x1(1),x1(2), '.')
end

wynik = p0
