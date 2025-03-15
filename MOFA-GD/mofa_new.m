function mofa_new(varargin)
save vargin.mat;
close all;
clear;
clc;
load vargin.mat; %#ok<*LOAD>
persistent time;
persistent n;
persistent tMax;
persistent nEl;
persistent Problem;
if isempty(varargin)
    time = 1; %算法运行次数
    n = 100; %种群数量
    tMax = 100; %最大迭代次数
    nEl = 100; %精英解最大容量
    %ZDT Viennet DTLZ BT IMOP WFG LSMOP
    Problem = 'DTLZ1';
else
    time = varargin{1};
    n = varargin{2};
    tMax = varargin{3};
    nEl = varargin{4};
    Problem = varargin{5};
end
% 加载问题
file__name = strcat(Problem, '.mat');
load(file__name);
% 获取对应问题的 m目标个数 d决策变量维度 ub上界 lb下界
[m, d, Ub, Lb] = problemCase(Problem);

sampNum = 20;

% 决策变量分析
dmd = dv_analysis(Problem, d, m, Ub, Lb, sampNum);
distVar = find(dmd == 0); % 距离变量
dmixVar = find(dmd ~= 0); % 分布变量和混合变量

% pv = dmd==1;
% dv = dmd==0;
% mv = dmd==2;

% disp(['距离变量的个数：',num2str(sum(dv)),'位置变量的个数：',num2str(sum(pv)),'混合变量的个数',num2str(sum(mv))]);

beta0 = 1.0; % 初始吸引度
gamma = 1.0; % 衰减系数
alpha = 1.0; % 步长初始因子
delta = 1.0 * (Ub - Lb); % 缩放因子
% mu = 0.1; % 变异率


c0 = 0.5; % 非均匀变异振幅
eta = power(0.2, (1 / tMax)); % 振幅减小


position = 0 * ones(n, d); % 存放萤火虫的位置 因为是n个萤火虫，搜索维度是d
cost = 0 * ones(n, m); % 存放函数值 因为是n个萤火虫m个目标函数 第一列是第一个目标函数的值 第二列是第二个目标函数的值

for i = 1:n
    position(i, :) = Lb + (Ub - Lb) .* rand(1, d); %生成1行d列区间在(Lb,Ub)的随机数
    cost(i, 1:m) = obj_funs(position(i, :), Problem); %通过m个目标函数计算出m个对应的值 f矩阵中的第一行
end

iigd = zeros(tMax, 1);
% 获取种群
pop = [position, cost];

% 快速非支配排序
pop = NDsort(pop, m, d);

% 获取精英解
elite_index = find((pop(:, d+m+1) == 1) == 1);
add_num = numel(elite_index);
elite(1:add_num, :) = pop(elite_index, :);

% 获取种群位置
position = pop(:, 1:d);
% 获取适应值
cost = pop(:, (d + 1):(d + m));


time1 = clock;
for t = 1:tMax

    mu = exp(t/tMax-1);
    c0 = c0 * eta;
    % 获取当前最好解（权重）
    w = assign_Weight(m);
    g_position = position(1, :);
    g_cost = cost(1, :);
    for i = 2:n
        if w * g_cost' > w * cost(i, :)'
            g_position = position(i, :);
            g_cost = cost(i, :);
        end
    end


    for i = 1:n

        % 计时器 count==0 代表此个体没有被支配过
        count = 0;
        for j = i:n
            % 计算欧式距离
            rij = sqrt(sum((position(i, :) - position(j, :)).^2));

            % 计算吸引度
            beta1 = beta0 * exp(-gamma*rij.^2);

            % 生成扰动项
            steps = delta .* ones(1, d) * (rand - 0.5) * 2;

            if cost(j, 1:m) <= cost(i, 1:m)
                % 萤火虫移动
                position(i, :) = position(i, :) + beta1 * (position(j, :) - position(i, :)) + alpha * steps;
                count = count + 1;
            end

            if count == 0
                % 萤火虫随机移动
                position(i, :) = g_position(1, :) + alpha * steps;
            end

            % 越界处理
            position(i, :) = simplebounds(position(i, :), Lb, Ub); %保证萤火虫i移动的位置在范围内

            % 重新评估适应值
            cost(i, 1:m) = obj_funs(position(i, 1:d), Problem); %重新计算亮度（也就是把解带入到函数中求出函数值）


            % 变异
            if rand < mu

                mu_position = position(i, :);

                % 学习
                dis2 = elite(randi(numel(elite(:, 1))), :);
                dis2_position = dis2(:, 1:d);
                % 权重相加
                w = assign_Weight(2);
                mu_position(1, distVar(:, :)) = w(1) * dis2_position(1, distVar(:, :)) + w(2) * g_position(1, distVar(:, :));

                % mu_position(1, dmixVar) = (dis2_position(1, dmixVar) + g_position(1, dmixVar)) / 2 + ((dis2_position(1, dmixVar) - g_position(1, dmixVar)) / 2) * rand;
                % 从混合变量和分布变量中随机选取一维
                mu_index = dmixVar(randi(numel(dmixVar)));
                % 变异
                mu_position(1, mu_index) = mu_position(1, mu_index) + c0 * 0.1 * tan(pi * (rand - 0.5)) * (Ub(mu_index) - Lb(mu_index));

                % 越界处理
                mu_position(1, :) = simplebounds(mu_position(1, :), Lb, Ub);

                % 重新评估适应值
                mu_cost = obj_funs(mu_position(1, :), Problem);

                if mu_cost(1, 1:m) <= cost(i, 1:m)
                    position(i, :) = mu_position(1, :);
                    cost(i, 1:m) = mu_cost(1, 1:m);
                elseif mu_cost(1, 1:m) > cost(i, 1:m)
                else
                    if rand < 0.5
                        position(i, :) = mu_position(1, :);
                        cost(i, 1:m) = mu_cost(1, 1:m);
                    end % end if rand < 0.5
                end % end if mu_cost(1, 1:m) <= cost(i, 1:m)
            end % end if rand < mu

        end % end for j
    end % end for i

    % 合并成种群
    all_pop = [position, cost];

    % 快速非支配排序
    all_pop = NDsort(all_pop, m, d);


    % 获取精英解
    elite_index = find((all_pop(:, d+m+1) == 1) == 1);
    add_num = numel(elite_index);
    new_elite(1:add_num, :) = all_pop(elite_index, :);


    % 更新外部档案
    % 档案截断法
    elite = update_elite_odist([elite; new_elite(:, 1:d+m+1)], nEl, d, m);

    % 拥挤距离维护
    % elite = update_elite_cdist([elite; new_elite(:, 1:d+m+1)], nEl, d, m);


    % 信息提示
    if ~mod(t, 1)
        disp([strcat('测试函数:', Problem), strcat('##算法运行次数:', num2str(time)), strcat('##Iterations t=', num2str(t), '/', num2str(tMax))]);
        iigd(t) = IGD(elite(:, d+1:d+m), PF);
        % plotfg(elite(:, d+1:d+m));
        % plotfg(cost(:,1:m));
    end
    % pause(0.01);

end
time2 = clock;
time3 = etime(time2, time1);
disp(['time is:', num2str(time3)]);
% 计算IGD
per_igd = IGD(elite(:, d+1:d+m), PF);
disp(['igd is:', num2str(per_igd)]);

% 计算GD
per_gd = GD(elite(:, d+1:d+m), PF);
disp(['gd is:', num2str(per_gd)]);

% 计算MS
per_ms = Spread(elite(:, d+1:d+m),PF);
disp(['MS is:', num2str(per_ms)]);

plotfg(elite(:, d+1:d+m));
hold on;
plotPareto(Problem);
legend('MOFA-GD', 'PF', 'Location', 'northeast');
hold off;

save_name = strcat(Problem, '_', num2str(time), '_', num2str(n), '_', num2str(tMax), '_', num2str(nEl), '.mat');
save(save_name);