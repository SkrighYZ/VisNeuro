function [d, T, correct] = getDecision(orient1, orient2, c, time, B)
% Evidence accumulation model
% Simulate in given time with each trial equal to 10ms
% Get the decision variable d sequences corresponding to orient1
% Orientation in degrees
% No correlation noise taken into account (independent neurons)
% Diagonal Poisson variance on the covariance matrix
% T is the time simulated untill decision is made
% B is the bound for the max evidence (d value) we can reach
% If reaches the bound then make the decision immediately
% Else continue until T reaches time limit
% if final d > 0 then the decision is correct (orient1 chosen)
    
    n = 100;
    k = 5;
    fmax = 20;
    
    bin = 1 / 100;  % 10ms time bins
    tnum = time / bin;
    w = getWeights(orient1, orient2, c, n, k, fmax);
    r = getResponse(orient1, c, n, k, fmax, time);
    
    d = zeros(1, tnum);
    d(1, 1) = w * r(1, :).';
    T = 0.01;       % 10ms after one trial
    
    for t = 2 : tnum
       d(1, t) = d(1, t - 1) + w * r(t, :).';
       T = T + bin;
       if T >= 1 || abs(d(1, t)) >= B
           break
       end
    end 
    
    if d(1, t) >= B        % Fill in the remaining d data with B if reached
        for t = t : tnum
            d(1, t) = B;
        end
    elseif d(1, t) <= -B    % Same for -B if reached before time limit
        for t = t : tnum
            d(1, t) = -B;
        end
    end
    
    if d(1, tnum) >= 0      % Get the decision
        correct = 1;
    else 
        correct = 0;
    end
    
end

