function PopObj = BT3(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - sin(repmat(1:D, N, 1)*pi/2/D);
X(:, 1) = abs(X(:, 1)).^0.02;
PopObj(:, 1) = X(:, 1) + sum(Y(:, I1).^2+(1 - exp(-Y(:, I1).^2/1e-8))/5, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(Y(:, I2).^2+(1 - exp(-Y(:, I2).^2/1e-8))/5, 2);
PopObj = PopObj';
end