function f = UF1(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = X - sin(6*pi*repmat(X(:, 1), 1, D)+repmat(1:D, size(X, 1), 1)*pi/D);
f(:, 1) = X(:, 1) + 2 * mean(Y(:, J1).^2, 2);
f(:, 2) = 1 - sqrt(X(:, 1)) + 2 * mean(Y(:, J2).^2, 2);
f=f';
end