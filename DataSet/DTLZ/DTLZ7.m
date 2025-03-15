%n=21;
%x=[0 1];
function f = DTLZ7(x)
M = 3;
f = zeros(size(x, 1), M);
g = 1 + 9 * mean(x(:, M:end), 2);
f(:, 1:M-1) = x(:, 1:M-1);
f(:, M) = (1 + g) .* (M - sum(f(:, 1:M-1)./(1 + repmat(g, 1, M-1)).*(1 + sin(3*pi.*f(:, 1:M-1))), 2));
end
