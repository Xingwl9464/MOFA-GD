function f = MMMOP3A(X)
kA = 0;
c = 0;
d = 3;
M = 2;
y = X(:, 1:M-1) .* d - floor(X(:, 1:M-1).*d);
g = kA + sum(cos(2.*pi.*c.*X(:, M:M-1+kA)), 2) + sum((X(:, M+kA:end) - 0.5).^2, 2);
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(y*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(y(:, M-1:-1:1)*pi/2)];
end