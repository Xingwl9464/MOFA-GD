function score = GD(PopObj, optimum)

Distance = min(pdist2(PopObj, optimum), [], 2);
score = norm(Distance) / length(Distance);

end