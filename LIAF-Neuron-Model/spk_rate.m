function r = spk_rate(input)
% Parameter: initial potential(v0) and sequence of constant inputs
% Return the spike rate corresponding to each input
    r = zeros(1, length(input));
    v0 = -70;
    time = 1000;    % Simulate for 1 s
    delta_t = 0.1;
    for index = 1 : length(input)   % Loop for each constant input
        i_vec = ones(1, time / delta_t + 1) * input(index);     % Construct the sequence of constant input
        [~ , s] = mbr_pot(v0, time, i_vec);
        count = 0;      % Count number of spikes
        for j = s
            if j == 1
                count = count + 1;
            end    
        end    
        r(1, index) = count / time * 1000;     % Spike rate = count / time (#/s)
    end  
end

