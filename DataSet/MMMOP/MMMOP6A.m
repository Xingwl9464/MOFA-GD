function f = MMMOP6A(X)
kA = 0;
kB = 1;
c = 2;
M = 2;
N = size(X, 1);
y = (X(:, M:M+kA-1) - 0.5) * 12;
z = 2 * c * X(:, M+kA:end) - 2 * floor(c*X(:, M+kA:end)) - 1;
t = ones(N, kB);
for i = 1:kB
    for j = 1:M - 1
        t(:, i) = t(:, i) .* sin(2*pi*X(:, j)+(i - 1)*pi/kB);
    end
end
g = sum((y(:, 1:2:kA-1).^2 + y(:, 2:2:kA) - 11).^2+(y(:, 1:2:kA-1) + y(:, 2:2:kA).^2 - 7).^2, 2) + sum((z - t).^2, 2);
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(X(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(X(:, M-1:-1:1)*pi/2)];

end