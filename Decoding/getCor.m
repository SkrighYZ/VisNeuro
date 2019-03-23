function cor = getCor(n, cmax)
% Get the correlation matrix of n neurons
    tao = 0.5;
    neuron = (0 : pi / n : pi - pi / n);
    cor = zeros(n, n);
    for i = 1 : n
        for j = 1 : n
            cor(i, j) = cmax * exp(-abs(neuron(i) - neuron(j)) / tao);
        end
    end
end

