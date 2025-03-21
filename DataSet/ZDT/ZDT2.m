function z = ZDT2(x)
n = numel(x);
f1 = x(1);
g = 1 + 9 / (n - 1) * sum(x(2:end));
h = 1 - (f1 / g).^2;
f2 = g * h;
z = [f1,f2];
end
