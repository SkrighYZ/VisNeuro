function dp = getDp(orient1, orient2, c, n, k, fmax, cmax, tnum, dnum)
% Get the percent correct(d') from given number of trials(tnum)
% dnum stands for the weights used
% dnum = 0 for no correlation noise
% dnum = 1 for correlation noised, diagonally noised covariance
% else we use the optimal weights
    if dnum == 0
        [d1, d2] = getD(orient1, orient2, c, n, k, fmax, tnum);
    elseif dnum == 1
        [d1, d2] = getDnoised(orient1, orient2, c, n, k, fmax, cmax, tnum);
    else
        [d1, d2] = getDopt(orient1, orient2, c, n, k, fmax, cmax, tnum);
    end
    dp = (mean(d1) - mean(d2)) / sqrt(var(d1) + var(d2));
end

