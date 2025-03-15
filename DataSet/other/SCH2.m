%%%%%%%%
%n=1;
%Variable bounds: [-5,10];

function z = SCH2(x)
n = numel(x);
if x <= 1
    f1 = -x;
end
if x > 1 && x <= 3
    f1 = -2 + x;
end
if x > 3 && x <= 4
    f1 = 4 - x;
end
if x > 4
    f1 = -4 + x;
end
f2 = (x - 5)^2;
z = [f1, f2]';
end
