load('ZDT3.mat');

plot(PF(:, 1), PF(:, 2), 'k.');
xlabel('1^{st} Objective');
ylabel('2^{nd} Objective');
xlim([0, 0.9]);
ylim([-0.8, 1]);
