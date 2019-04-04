function p = percentCorrect(orient1, orient2, c, time, B, trialNum)
% Return the percent correct of the decision made in given number of trials
    correctNum = 0;
    for i = 1 : trialNum
        [~, ~, correct] = getDecision(orient1, orient2, c, time, B);
        if correct > 0
            correctNum = correctNum + 1;
        end
    end    
    p = correctNum / trialNum;
end

