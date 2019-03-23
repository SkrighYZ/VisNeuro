function spkc = spkcnt(num)
% Return the spike count of 100 trials each is of length 1 second
% Parameter num gives the method number

    spkc = zeros(1, 100);
    
    if num == 1             % Use Bernoulli generated sequence
        bnlspks = bnl(100);
        for i = 1 : 100
            for j = 1 : 1000
                spkc(1, i) = spkc(1, i) + bnlspks(1, j + 1000 * (i - 1));
            end
        end 
        
    elseif num == 2         % Use exponential ISI
        isi = expISI(110);  % Generate enough ISI for 110 seconds just in case
        countt = 1;         % Count trail
        time = 0;         % Count time passed
        for i = 1 : length(isi)
            if time > 1        % Reaches next trial
                if countt < 100
                    countt = countt + 1;
                    spkc(1, countt) = spkc(1, countt) + 1;
                    time = time - 1;
                    continue
                else 
                    break
                end    
            end
            spkc(1, countt) = spkc(1, countt) + 1;    % Each ISI signals one spike      
            time = time + isi(1, i);        % Increment time passed
        end    
    
    elseif num == 3                 % Poisson
        spkc = poissrnd(10, [1, 100]);
    end
end

