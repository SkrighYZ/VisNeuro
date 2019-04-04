function err = getError(p, trialNum)
% Get 1 * variance error sequence according to the p sequence
% (Includes 67 percent of the distribution)
    err = zeros(1, length(p));
    for i = 1 : length(p)
        err(1, i) = sqrt(p(1, i) * (1 - p(1, i)) / trialNum);
    end
end

