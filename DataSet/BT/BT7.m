function PopObj = BT7(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - repmat(sin(6*pi*X(:, 1)), 1, D);
PopObj(:, 1) = X(:, 1) + sum(Y(:, I1).^2+(1 - exp(-Y(:, I1).^2/1e-3))/5, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(Y(:, I2).^2+(1 - exp(-Y(:, I2).^2/1e-3))/5, 2);
PopObj = PopObj';
end