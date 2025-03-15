function PopObj = IDMPM2T1(x)
a = 3;
NP = 2;
psize = 0.10 .* ones(1, NP);
center = [-0.50, 0.50];
Points = [center - psize; center + psize];
PopObj = zeros(1, 2);
for i = 1:2
    temp = abs(repmat(x(:, 1), 1, NP)-repmat(Points(i, :), 1, 1));
    temp(:, 1) = temp(:, 1) + 1 .* (abs(x(:, 2)+0.5)).^1;
    temp(:, 2) = temp(:, 2) + a .* (abs(x(:, 2)-0.5)).^1;
    PopObj(:, i) = min(temp, [], 2);
end
end