%n=12;
%x=[0 1];
function f = DTLZ2(x)
M = 3;
g = sum((x(:, M:end) - 0.5).^2, 2);
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(x(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(x(:, M-1:-1:1)*pi/2)];
end
