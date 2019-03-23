function [d1, d2] = getD(orient1, orient2, c, n, k, fmax, tnum)
% Simulates for given number of trials(tnum)
% Get the decision variables d1 and d2 sequences corresponding to the 2 given orientations
% No correlation noise taken into account
% Diagonal Poisson variance on the covariance matrix
    d1 = zeros(1, tnum);
    d2 = zeros(1, tnum);
    
    f1 = getf(orient1, c, n, k, fmax);
    r1 = poissrnd(repmat(f1, tnum, 1), [tnum, n]);
    f2 = getf(orient2, c, n, k, fmax);
    r2 = poissrnd(repmat(f2, tnum, 1), [tnum, n]);
    
    w = getW(orient1, orient2 - orient1, c, n, k, fmax);
    
    for i = 1 : tnum
        d1(1, i) = w * r1(i, :).';
        d2(1, i) = w * r2(i, :).';
    end
    
end

