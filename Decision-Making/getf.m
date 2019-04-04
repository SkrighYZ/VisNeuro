function f = getf(inputOrient, c, n, k, fmax)
% Population response for euispaced neurons from 0 to pi 
% over input orientation(inputOrient)
% inputOrient in degrees, orient for specific neuron in radians 
    f = zeros(1, n);
    neuron = (0 : pi / n : pi - pi / n);    % Equispaced neurons of size n
    for i = 1 : n
        f(1, i) = getfi(inputOrient, neuron(1, i), c, k, fmax);
    end
end

