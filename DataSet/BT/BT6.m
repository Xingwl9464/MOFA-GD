function PopObj = BT6(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - repmat(X(:, 1), 1, D).^(0.5 + 1.5 * repmat(0:D-1, N, 1) / (D - 1));
PopObj(:, 1) = X(:, 1) + sum(Y(:, I1).^2+(1 - exp(-Y(:, I1).^2/1e-4))/5, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(Y(:, I2).^2+(1 - exp(-Y(:, I2).^2/1e-4))/5, 2);
PopObj = PopObj';
end