function PopObj = BT8(X)
[N, D] = size(X);
I1 = 2:2:D;
I2 = 3:2:D;
Y = X - repmat(X(:, 1), 1, D).^(0.5 + 1.5 * repmat(0:D-1, N, 1) / (D - 1));
DY = Y.^2 + (1 - exp(-Y.^2/1e-3)) / 5;
PopObj(:, 1) = X(:, 1) + sum(4*DY(:, I1).^2-cos(8*pi*DY(:, I1))+1, 2);
PopObj(:, 2) = 1 - sqrt(X(:, 1)) + sum(4*DY(:, I2).^2-cos(8*pi*DY(:, I2))+1, 2);
PopObj = PopObj';
end