%%%n=10
%Variable bounds:[0,1]

function z = ZDT6(x)
n = numel(x);

f1 = 1 - exp(-4*x(1)) * (sin(6*pi*x(1)))^6;
g = 1 + 9 * (sum(x(2:end)) / (n - 1))^0.25;
h = 1 - (f1 / g)^2;
f2 = g * h;
z = [f1, f2];
end
