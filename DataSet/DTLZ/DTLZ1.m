%n=7;
%x=[0 1];

% function f = DTLZ1(x)
% D = 7;
% M = 3;
% g = 100 * (D - M + 1 + sum((x(:, M:end) - 0.5).^2-cos(20.*pi.*(x(:, M:end) - 0.5)), 2));
% f = 0.5 * repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(x, 1), 1), x(:, 1:M - 1)], 2)) .* [ones(size(x, 1), 1), 1 - x(:, M-1:-1:1)];
% f = f';
% end

function f = DTLZ1(x)
D = 7;
M = 3;
g = 100 * (D - M + 1 + sum((x(:, M:end) - 0.5).^2-cos(20.*pi.*(x(:, M:end) - 0.5)), 2));
f = 0.5 * repmat(1+g, 1, M) .* fliplr(cumprod([ones(size(x, 1), 1), x(:, 1:M - 1)], 2)) .* [ones(size(x, 1), 1), 1 - x(:, M-1:-1:1)];
end

% function z = DTLZ1(x)
% K = 5;
% M = 3;
% g = 100 * (K + sum((x(:, M:end) - 0.5).^2-cos(20.*pi.*(x(:, M:end) - 0.5)), 2));
% for i = 1:M %计算第i维目标函数值
%     z(:, i) = 0.5 .* prod(x(:, 1:M-i), 2) .* (1 + g);
%     if i > 1
%         z(:, i) = z(:, i) .* (1 - x(:, M-i+1));
%     end
% end
%
% z = z';
% end
