function bnlspks = bnl(time)
% Return Bernoulli binary sequence in 1ms time bins of given time
    p = 0.01;           % Probability to spike
    bnlspks = zeros(1, time * 1000);
    for t = 1 : time * 1000
        bnlspks(1, t) = binornd(1, p);      % Binomial randomize result for each time bin
    end    
end

