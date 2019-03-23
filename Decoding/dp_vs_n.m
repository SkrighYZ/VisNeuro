function dp = dp_vs_n(orient1, orient2, c, n, cmax, dnum, vark, varfmax)
% Get the sequence of d' based on the given parameters
% Vary n 
% dnum stands for the weights used
% dnum = 0 for no correlation noise
% dnum = 1 for correlation noised, diagonally noised covariance
% else we use the optimal weights
    meank = 1.5;
    meanfmax = 20;
    if vark == 0
        k = ones(1, length(n)) * meank;
    else 
        fanok = vark / meank;
        k = gamrnd(meank / fanok, fanok, [1, length(n)]);
    end
    if varfmax == 0
        fmax = ones(1, length(n)) * meanfmax;
    else 
        fanofmax = varfmax / meanfmax;
        fmax = gamrnd(meanfmax / fanofmax, fanofmax, [1, length(n)]);
    end
    
    tnum = 1000;        % # of trials
    dp = zeros(1, length(n));
    for i = 1 : length(n)
        dp(1, i) = getDp(orient1, orient2, c, n(1, i), k(1, i), fmax(1, i), cmax, tnum, dnum);
    end
end

