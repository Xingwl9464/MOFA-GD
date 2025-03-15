function f = IDMPM3T1(x)
pgon = nsidedpoly(3);
psize = [.1, .1, .1, .1];
center = [-.50, -.50; .50, -.50; .50, .50; -.50, .50];
Points = NaN(3, 2, 4);
for i = 1:4
    Points(:, :, i) = pgon.Vertices .* psize(i) + center(i, :);
end
N = size(x, 1);
f = NaN(N, 3);
for i = 1:3
    temp = pdist2(x(:, 1:2), reshape(Points(i, :, :), [2, 4])');
    temp(:, 1) = temp(:, 1) + 1 .* (abs(x(:, 3)+.6));
    temp(:, 2) = temp(:, 2) + 2 .* (abs(x(:, 3)+.2));
    temp(:, 3) = temp(:, 3) + 3 .* (abs(x(:, 3)-.2));
    temp(:, 4) = temp(:, 4) + 4 .* (abs(x(:, 3)-.6));
    f(:, i) = min(temp, [], 2);
end
end