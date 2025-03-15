%nVar=2; x=[-3 3];
function f = Viennet3(x)
temp = x(:, 1).^2 + x(:, 2).^2;
f(:, 1) = 0.5 * temp + sin(temp);
f(:, 2) = (3 * x(:, 1) - 2 * x(:, 2) + 4).^2 / 8 + (x(:, 1) - x(:, 2) + 1).^2 / 27 + 15;
f(:, 3) = 1 ./ (temp + 1) - 1.1 * exp(-temp);
end
