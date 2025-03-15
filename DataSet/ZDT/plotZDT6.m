load('ZDT6.mat');

plot(PF(:, 1), PF(:, 2), 'k.');
xlabel('1^{st} Objective');
ylabel('2^{nd} Objective');
xlim([0.2, 1]);
ylim([0, 1]);