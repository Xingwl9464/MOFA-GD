function score = Spacing(PopObj)

Distance = pdist2(PopObj, PopObj, 'cityblock');
Distance(logical(eye(size(Distance, 1)))) = inf;
score = std(min(Distance, [], 2));
end