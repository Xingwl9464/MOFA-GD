function PopObj = IDMPM2T2(x)
a = 0.4;
NP = 2;
psize = 0.10 .* ones(1, NP);
center = [-0.50, 0.50];
Points = [center - psize; center + psize];
PopObj = zeros(1, 2);
for i = 1:2
    temp = abs(repmat(x(:, 1), 1, NP)-repmat(Points(i, :), 1, 1));
    temp(:, 1) = temp(:, 1) + 100 .* (abs(x(:, 2)+0.5)).^2;
    temp(:, 2) = temp(:, 2) + 100 .* (abs(x(:, 2)-0.5)).^(2 - a);
    PopObj(:, i) = min(temp, [], 2);
end
end