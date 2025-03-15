function PopObj = BT4(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - sin(repmat(1:D, N, 1)*pi/2/D);
temp1 = X(:, 1) < 0.25;
temp2 = 0.25 <= X(:, 1) & X(:, 1) < 0.5;
temp3 = 0.5 <= X(:, 1) & X(:, 1) < 0.75;
temp4 = 0.75 <= X(:, 1);
X(temp1, 1) = (1 - (1 - 4 * X(temp1, 1)).^0.06) / 4;
X(temp2, 1) = (1 + (4 * X(temp2, 1) - 1).^0.06) / 4;
X(temp3, 1) = (3 - (3 - 4 * X(temp3, 1)).^0.06) / 4;
X(temp4, 1) = (3 + (4 * X(temp4, 1) - 3).^0.06) / 4;
PopObj(:, 1) = X(:, 1) + sum(Y(:, I1).^2+(1 - exp(-Y(:, I1).^2/1e-8))/5, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(Y(:, I2).^2+(1 - exp(-Y(:, I2).^2/1e-8))/5, 2);
PopObj = PopObj';
end