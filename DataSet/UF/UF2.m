function f = UF2(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = zeros(size(X));
X1 = repmat(X(:, 1), 1, length(J1));
Y(:, J1) = X(:, J1) - (0.3 * X1.^2 .* cos(24*pi*X1+4*repmat(J1, size(X, 1), 1)*pi/D) + 0.6 * X1) .* cos(6*pi*X1+repmat(J1, size(X, 1), 1)*pi/D);
X1 = repmat(X(:, 1), 1, length(J2));
Y(:, J2) = X(:, J2) - (0.3 * X1.^2 .* cos(24*pi*X1+4*repmat(J2, size(X, 1), 1)*pi/D) + 0.6 * X1) .* sin(6*pi*X1+repmat(J2, size(X, 1), 1)*pi/D);
f(:, 1) = X(:, 1) + 2 * mean(Y(:, J1).^2, 2);
f(:, 2) = 1 - sqrt(X(:, 1)) + 2 * mean(Y(:, J2).^2, 2);
f=f';
end