function cov = getCov(c, n, k, fmax)
% Get the covariance matrix
% No correlation noise taken into account (independent neurons)
% Diagonal Poisson variance
    cov = zeros(n, n);
    for i = 1 : n
        orienti = (i - 1) * pi / n;
        cov(i, i) = getfi(0, orienti, c, k, fmax);
    end
end

