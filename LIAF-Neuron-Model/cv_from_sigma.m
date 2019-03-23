function cv = cv_from_sigma(i0, sigma, time)
% Parameters: mean of input(i0), sequence of standard deviations of
% input(sigma), simulation time for each sigma
% Returns: the CV of ISI's for each corresponding sigma
    cv = zeros(1, length(sigma));
    delta_t = 0.1;
    for index = 1 : length(sigma)   % Simulate for each
        input = gen_input(i0, sigma(1, index), time / delta_t + 1);     % Generate enough input to simulate
        isi = get_ISI(input, 1000);      % Here calls the simulation, collects 1000 ISI data
        cv(1, index) = std(isi) / mean(isi);
    end
end

