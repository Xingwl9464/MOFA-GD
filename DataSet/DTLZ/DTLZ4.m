%d=12;
%x=[0 1];
function f = DTLZ4(x)
n = numel(x);
a = 100;
g = 0;
for i = 3:n
    g = g + (x(i) - 0.5)^2;
end
f1 = cos(0.5*pi*(x(1)^a)) * cos(0.5*pi*(x(2)^a)) * (1 + g);
f2 = cos(0.5*pi*(x(1)^a)) * sin(0.5*pi*(x(2)^a)) * (1 + g);
f3 = sin(0.5*pi*(x(1)^a)) * (1 + g);

f = [f1, f2, f3];


% M = 3;
% x(:, 1:M-1) = x(:, 1:M-1).^100;
% g = sum((x(:, M:end) - 0.5).^2, 2);
% f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(x(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(x(:, M-1:-1:1)*pi/2)];
% f = f';
end