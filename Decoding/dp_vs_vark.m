function dp = dp_vs_vark(orient1, orient2, vark, dnum)
% Get the sequence of d' based on the given variance sequence of k
% dnum stands for the weights used
% dnum = 0 for no correlation noise
% dnum = 1 for correlation noised, diagonally noised covariance
% else we use the optimal weights
    mean = ones(1, length(vark)) * 1.5;
    fano = vark ./ mean;
    k = gamrnd(mean ./ fano, fano);
    fmax = 20;
    n = 1000;
    c = 0.1;
    tnum = 1000;
    cmax = 0.3;
    dp = zeros(1, length(k));
    for i = 1 : length(k)
        dp(1, i) = getDp(orient1, orient2, c, n, k(1, i), fmax, cmax, tnum, dnum);
    end
end

