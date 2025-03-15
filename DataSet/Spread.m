function score = Spread(PopObj, optimum)

[~,M] = size(PopObj);
score = 0;
for i=1:M
    fmax = max(PopObj(:,i));
    Fmax = max(optimum(:,i));
    
    fmin = min(PopObj(:,i));
    Fmin = min(optimum(:,i));
    
    if fmax<Fmin || fmin>Fmax
        score = score + 0;
        continue;
    end
    
    temp = (min(fmax,Fmax)-max(fmin,Fmin))/(Fmax-Fmin);
    score = score + temp * temp;
    
end

score = sqrt(score/M);

end