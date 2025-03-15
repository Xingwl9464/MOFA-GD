function f = UF6(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = X - sin(6*pi*repmat(X(:, 1), 1, D)+repmat(1:D, size(X, 1), 1)*pi/D);
f(:, 1) = X(:, 1) + max(0, 2*(1 / 4 + 0.1)*sin(4*pi*X(:, 1))) + 2 / length(J1) * (4 * sum(Y(:, J1).^2, 2) - 2 * prod(cos(20*Y(:, J1)*pi./sqrt(repmat(J1, size(X, 1), 1))), 2) + 2);
f(:, 2) = 1 - X(:, 1) + max(0, 2*(1 / 4 + 0.1)*sin(4*pi*X(:, 1))) + 2 / length(J2) * (4 * sum(Y(:, J2).^2, 2) - 2 * prod(cos(20*Y(:, J2)*pi./sqrt(repmat(J2, size(X, 1), 1))), 2) + 2);
f = f';
end