function wopt = getWopt(orient1, orient2, c, n, k, fmax, cmax)
% Get the read-out weights 
% Limited-range noise correlations
% Optimal covariance, poisson noised
    cov = getCovOpt(cmax, c, n, k, fmax);
    f1 = getf(orient1, c, n, k, fmax);
    f2 = getf(orient2, c, n, k, fmax);
    diff = f1 - f2;
    wopt = cov \ diff.';      % inv(cov) * diff
    wopt = wopt.';
end

