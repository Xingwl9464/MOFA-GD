function f = MMMOP2A(X)
kA = 1;
alpha = 100;
M = 2;
X(:, 1:M-1) = X(:, 1:M-1).^alpha;
y = 9.75 .* X(:, M:M+kA-1) + 0.25;
g = kA - sum(sin(10.*log(y)), 2) + sum((X(:, M+kA:end) - 0.5).^2, 2);
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(X(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(X(:, M-1:-1:1)*pi/2)];
end