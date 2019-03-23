function [d1, d2] = getDnoised(orient1, orient2, c, n, k, fmax, cmax, tnum)
% Simulates for given number of trials(tnum)
% Get the decision variables d1 and d2 sequences corresponding to the 2 given orientations
% Limited-range noise correlations
% Diagonal Poisson variance on the covariance matrix
    d1 = zeros(1, tnum);
    d2 = zeros(1, tnum);
    
    f1 = getf(orient1, c, n, k, fmax);
    f2 = getf(orient2, c, n, k, fmax);
    w = getWnoised(orient1, orient2, c, n, k, fmax, cmax);
    cov = getCovNoised(cmax, c, n, k, fmax);
    r1 = mvnrnd(repmat(f1, tnum, 1), cov);
    r2 = mvnrnd(repmat(f2, tnum, 1), cov);
    
    for i = 1 : tnum
        d1(1, i) = w * r1(i, :).';
        d2(1, i) = w * r2(i, :).';
    end
end

