function f = UF5(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = X - sin(6*pi*repmat(X(:, 1), 1, D)+repmat(1:D, size(X, 1), 1)*pi/D);
hY = 2 * Y.^2 - cos(4*pi*Y) + 1;
f(:, 1) = X(:, 1) + (1 / 20 + 0.1) * abs(sin(20*pi*X(:, 1))) + 2 * mean(hY(:, J1), 2);
f(:, 2) = 1 - X(:, 1) + (1 / 20 + 0.1) * abs(sin(20*pi*X(:, 1))) + 2 * mean(hY(:, J2), 2);
f = f';
end