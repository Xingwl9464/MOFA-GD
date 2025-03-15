function f = MMMOP1A(X)
kA = 1;
kB = 1;
M = 2;
[N,~]  = size(X);
g = 100 * (kA + kB - sum(sin(5.*pi.*X(:, M:M+kA-1)).^6, 2) + sum((X(:, M+kA:end) - 0.5).^2-cos(20.*pi.*(X(:, M+kA:end) - 0.5)), 2));
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(N, 1), X(:, 1:M - 1)], 2)) .* [ones(N, 1), 1 - X(:, M-1:-1:1)];
end