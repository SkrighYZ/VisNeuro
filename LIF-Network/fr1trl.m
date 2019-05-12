function [fr1, fr2] = fr1trl(wE, wI, I1, I2)
% Given excite weight wE, inhibit weight wI
% Input for 1st pool I1, for 2nd pool I2
% Return the mean firing rate for each pool across the network in 10 bins of 1s

    time = 1;   % s
    blength = 100; % ms
    bins = time * 1000 / blength;
    n = 10;
    trlnum = 10;
    fr1 = zeros(1, bins);
    fr2 = zeros(1, bins);
    
    allfr1 = zeros(trlnum, bins);
    allfr2 = zeros(trlnum, bins);
    
    for trial = 1 : trlnum
        [~, spks, ~] = sensNet(time, I1, I2, wE, wI, n);
        tcnt = 0;
        bin = 1;
        spksum1 = 0;
        spksum2 = 0;
        for t = 1 : time * 1000
            tcnt = tcnt + 1;
            for i = 1 : n
                if i <= n/2
                    spksum1 = spksum1 + spks(i, t);
                else
                    spksum2 = spksum2 + spks(i, t);
                end
            end
           
            if tcnt >= blength
                tcnt = 0;
                allfr1(trial, bin) = spksum1 / (n / 2 * (blength / 1000));
                allfr2(trial, bin) = spksum2 / (n / 2 * (blength / 1000));
                bin = bin + 1;
                spksum1 = 0;
                spksum2 = 0;
            end
                
        end
    end
    
    for bin = 1 : bins
        fr1(1, bin) = mean(allfr1(:, bin));
        fr2(1, bin) = mean(allfr2(:, bin));
    end
    
end

