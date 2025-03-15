%n=30;
%Variable bounds: [0,1];

function z = ZDT3(x)

n = numel(x);

f1 = x(1);

g = 1 + 9 / (n - 1) * sum(x(2:end));

h = 1 - sqrt(f1/g) - f1 / g * sin(10*pi*f1);

f2 = g * h;

z = [f1,f2];

end