%n=10;
%Variable bounds: x1=[0,1];x(2:end)=[-5 5]

% function z = ZDT4(x)
%
% n = numel(x);
%
% f1 = x(1);
% m = 0;
% for i = 2:n
%     m = m + x(i)^2 - 10 * cos(4*pi*x(i));
% end
% g = 1 + 10 * (n - 1) + m;
%
% h = 1 - sqrt(f1/g);
%
% f2 = g * h;
%
% z = [f1; ...
%     f2];
%
% end
function f = ZDT4(x)
f(:, 1) = x(:, 1);
g = 1 + 10 * (size(x, 2) - 1) + sum(x(:, 2:end).^2-10*cos(4*pi*x(:, 2:end)), 2);
h = 1 - (f(:, 1) ./ g).^0.5;
f(:, 2) = g .* h;
end