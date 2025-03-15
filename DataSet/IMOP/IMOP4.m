function PopObj = IMOP4(PopDec)
a1 = 0.05; % Parameter a1
K = 5; % Parameter K
y1 = mean(PopDec(:, 1:K), 2).^a1;
g = sum((PopDec(:, K+1:end) - 0.5).^2, 2);
PopObj(:, 1) = (1 + g) .* (y1);
PopObj(:, 2) = (1 + g) .* (y1 + sin(10*pi*y1) / 10);
PopObj(:, 3) = (1 + g) .* (1 - y1);
PopObj = PopObj';
end
