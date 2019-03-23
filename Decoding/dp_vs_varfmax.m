function dp = dp_vs_varfmax(orient1, orient2, varfmax, dnum)
% Get the sequence of d' based on the given variance sequence of fmax
% dnum stands for the weights used
% dnum = 0 for no correlation noise
% dnum = 1 for correlation noised, diagonally noised covariance
% else we use the optimal weights
    mean = ones(1, length(varfmax)) * 20;
    fano = varfmax ./ mean;
    fmax = gamrnd(mean ./ fano, fano);
    k = 1.5;
    n = 1000;
    c = 0.1;
    tnum = 1000;
    cmax = 0.3;
    dp = zeros(1, length(fmax));
    for i = 1 : length(fmax)
        dp(1, i) = getDp(orient1, orient2, c, n, k, fmax(1, i), cmax, tnum, dnum);
    end
end

