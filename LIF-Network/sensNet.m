function [V, spks, spkcnt] = sensNet(time, I1, I2, wE, wI, n)
% 2-Pool sensory LIF network by given time, given neuron number n
% Constant input for 1st pool I1, for 2nd pool I2
% Excite weight wE, inhibit weight wI
% Returns the membrane potential V
% And the binary spike sequence for each neuron spks
% And the spike count for each neuron spkcnt    

    decay = 20;
    v_rest = -65;
    v_thres = -50;
    v_reset = -70;
    dt = 1;   % ms
    bins = time * 1000 / dt;
    spkcnt = zeros(n, 1);
    
    % Calculate the connection strength matrix for two pools of neurons
    weights = zeros(n, n);
    for i = 1 : n
        for j = 1 : n
            if (i > n/2 && j > n/2) || (i <= n/2 && j <= n/2)
                weights(i, j) = wE;
            else
                weights(i, j) = wI;
            end          
        end
    end
    
    % Initialize membrane potential V
    V = zeros(n, bins);
    spks = zeros(n, bins);
    for i = 1 : n
        V(i, 1) = v_rest + rand() * (v_thres - v_reset);
        spks(i, 1) = 0;
    end
    
    % Simulate for given time
    for t = 2 : bins
        for i = 1 : n
            
            v_prev = V(i, t - 1);
            
            if v_prev > v_thres
                V(i, t) = v_reset;
                spks(i, t) = 1;
                spkcnt(i, 1) = spkcnt(i, 1) + 1;
                
            elseif v_prev < v_reset
                V(i, t) = v_reset;
                
            else 
                stim = 0;  % total weighted spike stimuli from other neurons
                for j = 1 : n
                    if spks(j, t - 1) == 1
                        stim = stim + weights(i, j);
                    end
                end
                
                if(i > n/2) 
                    input = I2;
                else
                    input = I1;
                end
                V(i, t) = v_prev + dt * (-1 / decay * (v_prev - v_rest) + input + stim);
            end
            
        end
    end
end

