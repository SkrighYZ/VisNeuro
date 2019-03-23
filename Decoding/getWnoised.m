function w = getWnoised(orient1, orient2, c, n, k, fmax, cmax)
% Get the read-out weights 
% Limited-range noise correlations
% Diagonal Poisson variance on the covariance matrix
    w = zeros(1, n);
    neuron = (0 : pi / n : pi - pi / n);    % Equispaced neurons of size n
    cov = getCovNoised(cmax, c, n, k, fmax);
    for i = 1 : n
        fprime = getfi(orient1, neuron(1, i), c, k, fmax) - getfi(orient2, neuron(1, i), c, k, fmax);
        w(1, i) = 1 / cov(i, i) * fprime;
    end
end

