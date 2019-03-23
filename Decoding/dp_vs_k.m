function dp = dp_vs_k(orient1, orient2, k)
% Get the sequence of d' based on input sequence k
% No correlation noise taken into account
% Diagonally Poisson noised covariance
    fmax = 20;
    n = 100;
    c = 1;
    tnum = 1000;
    dnum = 0;
    cmax = 0;
    dp = zeros(1, length(k));
    for i = 1 : length(k)
        dp(1, i) = getDp(orient1, orient2, c, n, k(1, i), fmax, cmax, tnum, dnum);
    end
end

