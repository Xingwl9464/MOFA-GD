function f = MMMOP4A(X)
kA = 0;
kB = 1;
c = 0;
d = 4;
M = 2;
N = size(X, 1);

y = zeros(N, M-1);
for i = 1:N
    for j = 1:M - 1
        dsum = 0;
        y(i, j) = X(i, j) * d * (d + 1) * 0.5;
        for m = d:-1:1
            dsum = dsum + m;
            if y(i, j) <= dsum
                y(i, j) = (y(i, j) - dsum + m) / d;
                break;
            end
        end
    end
end
g = 100 * (kA + kB + sum(cos(2.*pi.*c.*X(:, M:M-1+kA)), 2) + sum((X(:, M+kA:end) - 0.5).^2-cos(20.*pi.*(X(:, M+kA:end) - 0.5)), 2));
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(y*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(y(:, M-1:-1:1)*pi/2)];

end