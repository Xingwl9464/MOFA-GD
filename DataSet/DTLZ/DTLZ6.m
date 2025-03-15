%n=12;
%x=[0 1];
function f = DTLZ6(x)
M = 3;
g = sum(x(:, M:end).^0.1, 2);
Temp = repmat(g, 1, M-2);
x(:, 2:M-1) = (1 + 2 * Temp .* x(:, 2:M-1)) ./ (2 + 2 * Temp);
f = repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(g, 1), 1), cos(x(:, 1:M-1)*pi/2)], 2)) .* [ones(size(g, 1), 1), sin(x(:, M-1:-1:1)*pi/2)];
end

% function z = DTLZ6(x)
% n = numel(x);
% g = 0;
% for i = 3:n
%     g = g + x(i)^(0.1);
% end
% a1 = x(1) * (pi / 2);
% a2 = pi / (4 * (1 + g)) * (1 + 2 * x(2) * g);
% f1 = cos(pi/2*a1) * cos(pi/2*a2) * (1 + g);
% f2 = cos(pi/2*a1) * sin(pi/2*a2) * (1 + g);
% f3 = sin(pi/2*a1) * (1 + g);
% 
% z = [f1, f2, f3]';
% 
% end
