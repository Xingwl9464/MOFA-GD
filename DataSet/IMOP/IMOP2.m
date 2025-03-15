function PopObj = IMOP2(PopDec)
a1 = 0.05; % Parameter a1
K = 5; % Parameter K
y1 = mean(PopDec(:, 1:K), 2).^a1;
g = sum((PopDec(:, K+1:end) - 0.5).^2, 2);
PopObj(:, 1) = g + cos(y1*pi/2).^0.5;
PopObj(:, 2) = g + sin(y1*pi/2).^0.5;
PopObj = PopObj';
end
