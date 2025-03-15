function PopObj = BT2(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - sin(repmat(1:D, N, 1)*pi/2/D);
PopObj(:, 1) = X(:, 1) + sum(Y(:, I1).^2+abs(Y(:, I1)).^(1 / 5)/5, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(Y(:, I2).^2+abs(Y(:, I2)).^(1 / 5)/5, 2);
PopObj = PopObj';
end