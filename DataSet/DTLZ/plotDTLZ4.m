load('DTLZ4.mat');

% scatter3(PF(:, 1), PF(:, 2), PF(:, 3), 'c.');
scatter3(PF(:, 1), PF(:, 2), PF(:, 3),'SeriesIndex',1,'DisplayName','PF',...
    'MarkerEdgeColor',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'MarkerFaceAlpha',0.5,...
    'MarkerFaceColor',[0.650980392156863 0.650980392156863 0.650980392156863],...
    'Marker','.');
xlabel('1^{st} Objective');
ylabel('2^{nd} Objective');
zlabel('3^{rd} Objective');
xlim([0 1.2]);
ylim([0 1.2]);
zlim([0 1.2]);