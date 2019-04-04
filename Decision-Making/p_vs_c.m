function p = p_vs_c(orient1, orient2, c, time, B, trialNum)
% Get the percent correct sequence base on the given contrast sequence(c)
% Fix time limit(time) and bound(B)
    p = zeros(1, length(c));
    for i = 1 : length(c)
        p(1, i) = percentCorrect(orient1, orient2, c(1, i), time, B, trialNum);
    end
end

