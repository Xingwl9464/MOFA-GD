function f = UF3(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = X - repmat(X(:, 1), 1, D).^(0.5 * (1 + 3 * (repmat(1:D, size(X, 1), 1) - 2) / (D - 2)));
f(:, 1) = X(:, 1) + 2 / length(J1) * (4 * sum(Y(:, J1).^2, 2) - 2 * prod(cos(20*Y(:, J1)*pi./sqrt(repmat(J1, size(X, 1), 1))), 2) + 2);
f(:, 2) = 1 - sqrt(X(:, 1)) + 2 / length(J2) * (4 * sum(Y(:, J2).^2, 2) - 2 * prod(cos(20*Y(:, J2)*pi./sqrt(repmat(J2, size(X, 1), 1))), 2) + 2);
f = f';
end