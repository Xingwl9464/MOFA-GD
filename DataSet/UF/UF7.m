function f = UF7(X)
J1 = 3:2:obj.D;
J2 = 2:2:obj.D;
Y = X - sin(6*pi*repmat(X(:, 1), 1, obj.D)+repmat(1:obj.D, size(X, 1), 1)*pi/obj.D);
f(:, 1) = X(:, 1).^0.2 + 2 * mean(Y(:, J1).^2, 2);
f(:, 2) = 1 - X(:, 1).^0.2 + 2 * mean(Y(:, J2).^2, 2);
f = f';
end