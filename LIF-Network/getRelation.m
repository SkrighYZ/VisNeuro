function [mFR, cvFR, cvISI] = getRelation(num, wmax, Imax)
% Vary w and I by given num and given limits
% Returns mean firing rate, CV of firing rate, and CV of ISI across the network

    time = 10;
    n = 10;
    w = [wmax / num : wmax / num : wmax];
    I = [Imax / num : Imax / num : Imax];
    mFR = zeros(num, num);
    cvFR = zeros(num, num);
    cvISI = zeros(num, num);
    
    for iw = 1 : length(w)
        for iI = 1 : length(I)
            [~, spks, spkcnt] = randNet(time, I(1, iI), w(1, iw), n);
            [~, cvISI(iw, iI)] = getISI(spks, spkcnt);
            [~, mFR(iw, iI), cvFR(iw, iI)] = getFR(spkcnt, time);
        end
    end

end

