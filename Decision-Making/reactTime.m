function [pfast, Ttotal, Tcorrect, Twrong] = reactTime(orient1, orient2, c, time, B, trialNum)
% pfast is the percentage of fast react
% Ttotal is the sequence of reaction times for all trials
% Tcorrect is for trials that have made the right decisions
% T wrong is for trials that have made the wrong decisions

    fastReact = 0;      % Count fast reaction numbers
    Ttotal = zeros(1, trialNum);
    
    correctNum = 0;     % Count correct decision trial numbers
    Tcorrect_temp = zeros(1, trialNum);     
    Twrong_temp = zeros(1, trialNum);
    
    for i = 1 : trialNum
        
        [~, T, correct] = getDecision(orient1, orient2, c, time, B);
        if T < 1
            fastReact = fastReact + 1;
        end
        
        if correct > 0
            correctNum = correctNum + 1;
            Tcorrect_temp(1, i) = T;
        else
            Twrong_temp(1, i) = T;
        end
        
        Ttotal(1, i) = T;
    end
    
    pfast = fastReact / trialNum;
    
    Tcorrect = zeros(1, correctNum);            
    Twrong = zeros(1, trialNum - correctNum);
    countc = 0;
    countw = 0;                     % Fill in reaction time values for each group
    for i = 1 : trialNum
        if Tcorrect_temp(1, i) ~= 0
            countc = countc + 1;
            Tcorrect(1, countc) = Tcorrect_temp(1, i);
        end
        if Twrong_temp(1, i) ~= 0
            countw = countw + 1;
            Twrong(1, countw) = Twrong_temp(1, i);
        end
    end
   
end

