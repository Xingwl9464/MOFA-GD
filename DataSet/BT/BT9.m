function PopObj = BT9(X)
[N, D] = size(X);
I1 = 3:3:D;
I2 = 4:3:D;
I3 = 5:3:D;
Y = X - sin(repmat(1:D, N, 1)*pi/2/D);
PopObj(:, 1) = cos(0.5*X(:, 1)*pi) .* cos(0.5*X(:, 2)*pi) + sum(Y(:, I1).^2+(1 - exp(-Y(:, I1).^2/1e-9))/5, 2);
PopObj(:, 2) = cos(0.5*X(:, 1)*pi) .* sin(0.5*X(:, 2)*pi) + sum(Y(:, I2).^2+(1 - exp(-Y(:, I2).^2/1e-9))/5, 2);
PopObj(:, 3) = sin(0.5*X(:, 1)*pi) + sum(Y(:, I3).^2+(1 - exp(-Y(:, I3).^2/1e-9))/5, 2);
PopObj = PopObj';
end