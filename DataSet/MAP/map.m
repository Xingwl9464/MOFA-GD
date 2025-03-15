function y = map(X)

% 给定坐标
coords1 = [3, 37; 42, 96; 45, 60; 50, 25; 83, 72; 98, 38];
%X = [0.5, 0.5]; % 假设X的坐标为[0.5, 0.5]
% 计算X和给定坐标之间的距离
distances = sqrt(sum((coords1 - repmat(X, size(coords1, 1), 1)).^2, 2));
% 返回最小的距离
f1 = min(distances);
% 给定坐标
coords1 = [40, 20; 51, 60; 95, 51];
%X = [0.5, 0.5]; % 假设X的坐标为[0.5, 0.5]
% 计算X和给定坐标之间的距离
distances = sqrt(sum((coords1 - repmat(X, size(coords1, 1), 1)).^2, 2));
% 返回最小的距离
f2 = min(distances);
% 给定坐标
coords1 = [10, 55; 15, 15; 15, 78; 15, 88; 20, 23; 20, 70; 32, 42; 35, 60; 40, 76; 52, 78; 52, 96; 55, 33; 75, 27];
%X = [0.5, 0.5]; % 假设X的坐标为[0.5, 0.5]
% 计算X和给定坐标之间的距离
distances = sqrt(sum((coords1 - repmat(X, size(coords1, 1), 1)).^2, 2));
% 返回最小的距离
f3 = min(distances);
% 给定坐标
coords1 = [17.5, 82.5; 55.5, 82.5; 94.5, 6.5];
%X = [0.5, 0.5]; % 假设X的坐标为[0.5, 0.5]
% 计算X和给定坐标之间的距离
distances = sqrt(sum((coords1 - repmat(X, size(coords1, 1), 1)).^2, 2));
% 返回最小的距离
f4 = min(distances);


y = [f1 f2 f3 f4];


end