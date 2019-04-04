function r = getResponse(inputOrient, c, n, k, fmax, time)
% Get the poisson noised population response
% Simulate in given time with each trial equal to 10ms
    tnum = time * 100;      % 100 trials in 1 second
    f = getf(inputOrient, c, n, k, fmax);
    r = poissrnd(repmat(f, tnum, 1), [tnum, n]);
end

