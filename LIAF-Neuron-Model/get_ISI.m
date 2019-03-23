function isi = get_ISI(input, size)
% Parameter: input sequence and size of ISI wanted
% Return: sequence of ISI's with given size
    isi = zeros(1, size);
    v0 = -70;
    delta_t = 0.1;
    time = (length(input) - 1) * delta_t;
    
    [~, s] = mbr_pot(v0, time, input);  % Simulate
    
    interval = 0;       % Count the intervals passed between spikes
    count = 1;      % Count the number of ISI's recorded
    for index = 1 : length(s)
        if count > size
            break
        end
        
        if s(1, index) == 0
            interval = interval + 1;
        else                                % Spike detected
            interval = interval + 1;
            isi(1, count) = interval * delta_t;     % Record time from last spike
            interval = 0;
            count = count + 1;
        end    
    end   
end

