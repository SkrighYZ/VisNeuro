function r = spk_rate_from_sigma(i0, sigma, time)
% Parameters: mean of input(i0), sequence of standard deviations of
% input(sigma), simulation time for each sigma
% Returns: the spiking rate for each corresponding sigma
    r = zeros(1, length(sigma));
    delta_t = 0.1;
    for index = 1 : length(sigma)       % Simulate for each sigma
        input = gen_input(i0, sigma(1, index), time / delta_t + 1); % Generate enough input
        [~, s] = mbr_pot(-70, time, input);     % Simulate
        count = 0;      % Count number of spikes each simulation
        for j = s
            if j == 1
                count = count + 1;
            end    
        end
        r(1, index) = count / time * 1000;      % Record spiking rate
    end
end

