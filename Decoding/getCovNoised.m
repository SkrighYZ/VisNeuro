function cov = getCovNoised(cmax, c, n, k, fmax)
% Get the covariance matrix
% Limited-range noise correlations
% Diagonal Poisson variance
    cov = zeros(n, n);
    cor = getCor(n, cmax);
    f = getf(0, c, n, k, fmax);
    for i = 1 : n
        cov(i, i) = cor(i, i) * sqrt(f(1, i) * f(1, i));
    end
end
