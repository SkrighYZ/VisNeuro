function [diff, percentCorrect] = psychometric(wE, wI, sumI, diffrange, diffnum)
% Psychometric curve where 
% percentCorrect is the percent when d > 0 (Choose I2 > I1)
% diff is the increasing values of I2 - I1 following the given constraints
% Given excite weight wE, inhibit weight wI
% sumI is the fixed value of I2 + I1
% diffrange is the limited range of I2 - I1
% diffnum is the number of values of I2 - I1 we take (length of diff)

    time = 1;
    n = 10;
    trlnum = 100;
    v = [-1, -1, -1, -1, -1, 1, 1, 1, 1, 1];
    
    I1 = zeros(1, diffnum);
    I2 = zeros(1, diffnum);
    percentCorrect = zeros(1, diffnum);
    halfsum = sumI / 2;
    ddiff = diffrange / 2 / diffnum;
    for i = 1 : diffnum
        I1(1, i) = halfsum - (i - 1) * ddiff;
        I2(1, i) = halfsum + (i - 1) * ddiff;
        
        correctcnt = 0;
        for trial = 1 : trlnum
            [~, ~, spkcnt] = sensNet(time, I1(1, i), I2(1, i), wE, wI, n);
            d = 0;
            for j = 1 : n
                d = d + v(1, j) * spkcnt(j, 1);
            end
            if d > 0 
                correctcnt = correctcnt + 1;
            end
        end
        percentCorrect(1, i) = correctcnt / trlnum;
    end
    diff = I2 - I1;
    
end

