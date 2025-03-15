function pop = crowding_dis(Sorted_frontRank, m, d)

% Pareto等级存放的位置
Rcol = d + m + 1;

% 获取种群个数
numpop = numel(Sorted_frontRank(:, 1));
% 获取Pareto最小等级（最大值）
rank_length = Sorted_frontRank(numpop, Rcol);
% 存放Pareto等级为i的个体下标  i=1,2,3......rank_length。
pf.R = [];
% 初始化PF
PF = repmat(pf, 1, rank_length);



% 获取PF.R
for i = 1:rank_length
    PF(i).R = find(([Sorted_frontRank(:, Rcol)] == i) == 1); %#ok<NBRAK>
end

Qi = 0;
for frontRank = 1:rank_length
    % 定义一个矩阵
    dc = zeros(length(PF(frontRank).R), Rcol);
    past_Q = Qi + 1;
    for i = 1:length(PF(frontRank).R)
        dc(i, :) = Sorted_frontRank(Qi+i, :);
    end
    Qi = Qi + i;

    % 解决方案根据其适应度/目标值进行排序
    fobj_all_adj = zeros(numel(dc(:, 1)), 2*m);

    for i = 1:m
        [~, f_Rank] = sort(dc(:, d+i));
        fobj_sorted = dc(f_Rank, :);
        % 求fobj值的最大值和最小值
        fobj_max = fobj_sorted(length(f_Rank), d+i);
        fobj_min = fobj_sorted(1, d+i);
        % 计算fobj的范围
        f_range = fobj_max - fobj_min;
        % 如果解在末端/边缘，则将其距离设为无穷大
        dc(f_Rank(length(f_Rank)), Rcol+i) = Inf;
        dc(f_Rank(1), Rcol+i) = Inf;
        for j = 2:length(f_Rank) - 1

            fobj2 = fobj_sorted(j+1, d+i);
            fobj1 = fobj_sorted(j-1, d+i);

            fobj_all_adj(f_Rank(j), 2*i-1) = f_Rank(j-1);
            fobj_all_adj(f_Rank(j), 2*i) = f_Rank(j+1);
            % 检查范围或特殊情况
            if (f_range == 0)
                dc(f_Rank(j), Rcol+i) = Inf;
            else
                % 计算第i维的拥挤距离
                dc(f_Rank(j), Rcol+i) = (fobj2 - fobj1) / f_range;
            end
        end % end of j
    end % end of i

    % 获取每个维度的拥挤距离
    Crow_dist = dc(:, d+m+2:end);
    % 找到距离最小的那个维度 并用索引记录下来 minindex
    [~, minIndex] = min(Crow_dist, [], 2);

    % 定义一个矩阵 第一列存放最小维度上的前一个 第二列存放后一个
    fobj_min_adj = zeros(numel(dc(:, 1)), 2);

    for iindex = 1:numel(dc(:, 1))
        fobj_min_adj(iindex, 1) = fobj_all_adj(iindex, 2*minIndex(iindex)-1);
        fobj_min_adj(iindex, 2) = fobj_all_adj(iindex, 2*minIndex(iindex));
    end

    % 计算并更新帕累托前沿上的拥挤距离
    dist = zeros(length(PF(frontRank).R), 1);
    for i = 1:m
        dist(:, 1) = dist(:, 1) + Crow_dist(:, i);
    end

    % 将拥挤距离(dc)存储在Rcol+1=ndim+m+2列中
    dist(:, 2:3) = fobj_min_adj;
    dc(:, Rcol+1:Rcol+3) = dist;
    dc = dc(:, 1:Rcol+3);

    % 更新输出
    xy(past_Q:Qi, :) = dc;
end % end frontRank
pop = xy();
% end Crowing_dis
end