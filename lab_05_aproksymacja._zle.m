% 1)

% xi = input("Wprowadź wektor współrzędnych węzłów x: ");
% yi = input("Wprowadź wektor współrzędnych węzłów x: ");

% p = input("Wprowadź stopień wielomianu");

% xi = [-2, -1, 0, 2,4];
% yi = [-1,0,5,99,-55];
% 
% p = 4;
% 
% % 2)
% 
% % psi * A = F
% PSI = zeros(length(xi), p + 1, p+1);
% 
% for k = 1: length(xi)
%     for i = 1 : p + 1
%         for j = 1 : p + 1
%             PSI(k, i, j) = xi(k) ^ (i + j - 2);
%         end
%     end
% end
% 
% PSI
% 
% F = zeros(length(xi), p + 1);
% 
% for i = 1 : length(xi)
%     for j = 1 : p + 1
%         F(i, j) = yi(j) * xi(j) ^ (j - 1);
%     end
% end
% 
% F
% 
% for i = 1 : length(xi)
%     PSI(i, :, :)
% end







% 1)

% xi = input("Wprowadź wektor współrzędnych węzłów x: ");
% yi = input("Wprowadź wektor współrzędnych węzłów x: ");

% p = input("Wprowadź stopień wielomianu");

xi = [-2, -1, 0, 2,4];
yi = [-1,0,5,99,-55];

p = 4;

% 2)

% psi * A = F
PSI = zeros(p + 1, p + 1);
F = zeros([1, p + 1])';

for k = 1 : length(xi)
    for i = 1 : p + 1
        for j = 1 : p + 1
            PSI(i, j) = xi(k) ^ (i + j - 2);
        end
    end

    for i = 1 : p + 1
        F(i) = yi(k) * xi(k) ^ (i - 1);
    end

      A(k) = inv(PSI)
end



% H = (od 0 do n) (w(xi) -yi)^2 -> min
% h(a0, a1, .. , append) -> min

