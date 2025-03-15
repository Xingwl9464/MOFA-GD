function f = UF4(X)
J1 = 3:2:D;
J2 = 2:2:D;
Y = X - sin(6*pi*repmat(X(:, 1), 1, D)+repmat(1:D, size(X, 1), 1)*pi/D);
hY = abs(Y) ./ (1 + exp(2*abs(Y)));
f(:, 1) = X(:, 1) + 2 * mean(hY(:, J1), 2);
f(:, 2) = 1 - X(:, 1).^2 + 2 * mean(hY(:, J2), 2);
f = f';
end