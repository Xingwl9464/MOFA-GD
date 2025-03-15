function mmd = dv_analysis(Problem, d, m, Ub, Lb,sampNum)

mmd = zeros(1, d) - 1;

position = 0 * ones(sampNum, d);
cost = 0 * ones(sampNum, m);

position(1, :) = Lb + (Ub - Lb) .* rand(1, d);
cost(1, 1:m) = obj_funs(position(1, :), Problem);

for xi = 1:d

    for i = 2:sampNum
        position(i, :) = position(1, :);
        position(i, xi) = Lb(xi) + (Ub(xi) - Lb(xi)) .* rand;
        cost(i, 1:m) = obj_funs(position(i, :), Problem);
    end

    pop = [position, cost];
    pop = NDsort(pop, m, d);


    maxpareto = max(pop(:, d+m+1));
    if maxpareto == 1
        mmd(xi) = 1;
    elseif maxpareto == sampNum
        mmd(xi) = 0;
    else
        mmd(xi) = 2;
    end
    % plotfg(pop(:, d+1:d+m));
end


end