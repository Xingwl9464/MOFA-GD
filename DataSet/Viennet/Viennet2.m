%[-4 4] 2
function f = Viennet2(x)
f(:, 1) = (x(:, 1) - 2).^2 / 2 + (x(:, 2) + 1).^2 / 13 + 3;
f(:, 2) = (x(:, 1) + x(:, 2) - 3).^2 / 36 + (-x(:, 1) + x(:, 2) + 2).^2 / 8 - 17;
f(:, 3) = (x(:, 1) + 2 * x(:, 2) - 1).^2 / 175 + (2 * x(:, 2) - x(:, 1)).^2 / 17 - 13;
end
