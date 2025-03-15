function f = IDMPM3T3(x)
M=3;
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
    temp(:, 1) = temp(:, 1) + 100 .* (x(:, 3) + .6).^2;
    t2 = x(:, 1) - .5 + x(:, 2) + .5;
    temp(:, 2) = temp(:, 2) + 100 .* (x(:, 3) + .2 + .1 .* t2).^2;
    t3 = x(:, 1) - .5 + x(:, 2) - .5;
    temp(:, 3) = temp(:, 3) + 100 .* (x(:, 3) - .2 + .2 .* t3).^2;
    t4 = x(:, 1) + .5 + x(:, 2) - .5;
    temp(:, 4) = temp(:, 4) + 100 .* (x(:, 3) - .6 + .3 .* t4).^2;
    f(:, i) = min(temp, [], 2);
end
end