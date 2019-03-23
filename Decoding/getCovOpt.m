function cov = getCovOpt(cmax, c, n, k, fmax)
% Get the covariance matrix
% Limited-range noise correlations
% Optimal covariance, poisson noised
    cov = zeros(n, n);
    cor = getCor(n, cmax);
    f = getf(0, c, n, k, fmax);
    for i = 1 : n
        for j = 1 : n
            cov(i, j) = cor(i, j) * sqrt(f(1, i) * f(1, j));
        end
    end
end

