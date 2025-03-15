function PopObj = IMOP6(PopDec)
a1 = 0.05; % Parameter a1
a2 = 10; % Parameter a2
K = 5; % Parameter K
y1 = mean(PopDec(:, 1:2:K), 2).^a1;
y2 = mean(PopDec(:, 2:2:K), 2).^a2;
g = sum((PopDec(:, K+1:end) - 0.5).^2, 2);
r = max(0, min(sin(3*pi*y1).^2, sin(3*pi*y2).^2)-0.05);
PopObj(:, 1) = (1 + g) .* y1 + ceil(r);
PopObj(:, 2) = (1 + g) .* y2 + ceil(r);
PopObj(:, 3) = (0.5 + g) .* (2 - y1 - y2) + ceil(r);
PopObj = PopObj';
end
