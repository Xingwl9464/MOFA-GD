function f = IDMPM3T2(x)
M = 3;
pgon = nsidedpoly(M);
psize = [.1, .1, .1, .1];
center = [-.50, -.50; .50, -.50; .50, .50; -.50, .50];
Points = NaN(M, 2, 4);
for i = 1:4
    Points(:, :, i) = pgon.Vertices .* psize(i) + center(i, :);
end
N = size(x, 1);
f = NaN(N, M);
for i = 1:M
    temp = pdist2(x(:, 1:2), reshape(Points(i, :, :), [2, 4])');
    temp(:, 1) = temp(:, 1) + 100 .* (abs(x(:, 3)+.6)).^2;
    temp(:, 2) = temp(:, 2) + 100 .* (abs(x(:, 3)+.2)).^1.8;
    temp(:, 3) = temp(:, 3) + 100 .* (abs(x(:, 3)-.2)).^1.6;
    temp(:, 4) = temp(:, 4) + 100 .* (abs(x(:, 3)-.6)).^1.4;
    f(:, i) = min(temp, [], 2);
end
end