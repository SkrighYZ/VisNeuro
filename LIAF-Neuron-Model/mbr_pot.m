function [v, s] = mbr_pot(v0, time, input)
% Params: initial potential(v0), total time(time), input sequence(input) one for each time bin
% Return: the membrane potential sequence(v) and the binary spike sequence(s) of
% the LIAF neuron

    delta_t = 0.1;      % Time bin
    v = zeros(1, time / delta_t + 1);       % Membrane potential
    s = zeros(1, time / delta_t + 1);       % Binary spike indicator
    
    v_rest = -65;
    threshold = -50;
    v_reset = -70;
    decay_const = 20;
    
    v(1, 1) = v0;       % Simulate from t = 0
    count = 2;
    
    for t = delta_t : delta_t : time
        prev_v = v(1, count - 1);
        if prev_v > threshold
            v(1, count) = v_reset;
            s(1, count) = 1;        % Spike, reset
        elseif prev_v < v_reset
            v(1, count) = v_reset;  % Reset
        else 
            v(1, count) = prev_v - delta_t * (1 / decay_const * (prev_v - v_rest) - input(count));
        end    
        count = count + 1;      
    end
    
end    


 