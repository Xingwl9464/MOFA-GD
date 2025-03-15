function PopObj = IMOP5(PopDec)
a1 = 0.05; % Parameter a1
a2 = 10; % Parameter a2
K = 5; % Parameter K
y1 = mean(PopDec(:, 1:2:K), 2).^a1;
y2 = mean(PopDec(:, 2:2:K), 2).^a2;
g = sum((PopDec(:, K+1:end) - 0.5).^2, 2);
PopObj(:, 1) = 0.4 * cos(pi*ceil(y1*8)/4) + 0.1 * y2 .* cos(16*pi*y1);
PopObj(:, 2) = 0.4 * sin(pi*ceil(y1*8)/4) + 0.1 * y2 .* sin(16*pi*y1);
PopObj(:, 3) = 0.5 - sum(PopObj(:, 1:2), 2);
PopObj = PopObj + repmat(g, 1, 3);
PopObj = PopObj';
end
