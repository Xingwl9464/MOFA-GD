%n=12;
%x=[0 1];

function f = DTLZ3(x)
D = 12;
M = 3;
g = 100 * (D - M + 1 + sum((x(:, M:end) - 0.5).^2-cos(20.*pi.*(x(:, M:end) - 0.5)), 2));
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(x, 1), 1), cos(x(:, 1:M-1)*pi/2)], 2)) .* [ones(size(x, 1), 1), sin(x(:, M-1:-1:1)*pi/2)];
end
% function z = DTLZ3(x)
% 
% n = numel(x);
% h = 0;
% for i = 3:n
%     h = h + (x(i) - 0.5)^2 - cos(20*pi*(x(i) - 0.5));
% end
% g = 100 * (10 + h);
% f1 = cos(pi/2*x(1)) * cos(pi/2*x(2)) * (1 + g);
% f2 = cos(pi/2*x(1)) * sin(pi/2*x(2)) * (1 + g);
% f3 = sin(pi/2*x(1)) * (1 + g);
% 
% z = [f1, f2, f3]';
% end
