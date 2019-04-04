function [medTc, medTw] = medT_vs_c(orient1, orient2, c, time, B, trialNum)
% mediTc is the sequence of median reaction time in which the decision is correct
% medTw is the sequence of median reaction time in which the decision is incorrect
% Simulate for each c and get one medTc and one medTw for each c
% For each simulation (each c) run given number of trials
    medTc = zeros(1, length(c));
    medTw = zeros(1, length(c));
    
    for i = 1 : length(c)
        [~, ~, Tcorrect, Twrong] = reactTime(orient1, orient2, c(1, i), time, B, trialNum);
        medTc(1, i) = median(Tcorrect);
        medTw(1, i) = median(Twrong);
    end
end

