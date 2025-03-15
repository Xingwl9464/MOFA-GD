function elite = update_elite_cdist(input, nEl, d, m)


% 去重
[~, ind] = unique(input(:, 1:d+m), 'rows', 'stable');
input = input(ind, :);

% 非支配排序
input = NDsort(input(:, 1:d+m), m, d);
% 获取非支配解
elite_index = (input(:, d+m+1) == 1) == 1;
elite = input(elite_index, :);

% 计算外部档案的个体个数
elite_num = numel(elite(:, 1));

while elite_num > nEl
    % 计算拥挤距离
    elite = crowding_dis(elite(:, 1:d+m+1), m, d);

    % 获取DC
    dc = elite(:, d+m+2);
    [~, tmp_Rank] = sort(dc, 'descend');
    dc = elite(tmp_Rank, d+m+2:end);

    % 逻辑矩阵 choose
    choose = ones(numel(elite(:, 1)), 1);
    % 初始化逻辑矩阵 choose
    choose(tmp_Rank(nEl+1:end, :), :) = 0;
    % 外部档案的维护
    % 原理：在计算拥挤距离的时候就获取到了距离最近的那一维度的前一个个体和后一个个体
    % 遍历那些将要删除的个体，遍历到一个个体时，如果发现这个个体的逻辑矩阵值 choose等于1
    % 就说明这个个体被保护起来了  将不再进行删除
    % 如果这个个体的逻辑矩阵值choose等于0  说明这个个体没有被保护 就删除 并且个体数-1
    % 这个删除的个体要检查他距离值最近的那个维度的前一个个体和后一个个体 并把他们的逻辑值choose设置成1（保护）
    % 如果个体数没有减少到外部档案大小，则重新计算拥挤距离 重新排序
    % 当个体数减少到外部档案大小（nEl）相等时，则停止
    for i = nEl + 1:numel(elite(:, 1))
        % 检查个体有没有被保护 如果等于1就是被保护 如果等于0就是没有被保护
        if choose(tmp_Rank(i)) == 1
            continue;
        end
        % 个体i没有被保护 则保护个体i距离相近的维度上的前一个个体和后一个个体
        % 前一个个体
        befor_index = dc(i, 2);
        % 后一个个体
        after_index = dc(i, 3);
        % 对他们进行保护
        choose(befor_index) = 1;
        choose(after_index) = 1;
        % 个体数减1
        elite_num = elite_num - 1;
        if elite_num == nEl
            break;
        end
    end
    elite = elite((choose == 1), :);

    % 计算外部档案的个体个数
    elite_num = numel(elite(:, 1));
end
elite = elite(:, 1:d+m+1);