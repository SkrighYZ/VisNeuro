function spikes = getSpks(r)
% Return the poisson spike sequence with given spike rate sequence
    spikes = zeros(1, length(r));
    for i = 1 : length(r)
        spikes(1, i) = poissrnd(r(1, i) / 100);     % Scales to about 0.2 spikes per image
    end    
end

