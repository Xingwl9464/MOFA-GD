function z = ZDT1(X)
n = numel(X);
f1 = X(1);
g = 1 + 9 / (n - 1) * sum(X(2:end));
h = 1 - sqrt(f1/g);
f2 = g * h;
z = [f1, f2];

end