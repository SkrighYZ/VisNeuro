function [spl_dry, spl_wet] = genGibbsSamples(prob_all)
    % porb_all is the table of probabilities of all combinations of P(sky,
    % spr, rain, grass)s
    % Performs Gibbs sampling on the graphical model 
    % Returns 2 * 1000 samples given grass = dry and grass = wet, respectively
    % Column 1 = sky, column 2 = sprinkler, column 3 = rain
    
    % Grass = dry
    curr = [binornd(1, 0.5), binornd(1, 0.5), binornd(1, 0.5)];     % Current values
    spl_dry = zeros(1000, 3);
    for t = 1 : 1000
        % Update current values
        % P(sky|spr, rain, grass) = P(sky, spr, rain, grass) / P(spr, rain, grass)
        index = curr(1, 2) * 4 + curr(1, 3) * 2 + 1;
        p_sky = prob_all(1, index + 8) / (prob_all(1, index + 8) + prob_all(1, index));
        curr(1, 1) = binornd(1, p_sky);
        % P(spr|sky, rain, grass) = P(sky, spr, rain, grass) / P(sky, rain, grass)
        index = curr(1, 1) * 8 + curr(1, 3) * 2 + 1;
        p_spr = prob_all(1, index + 4) / (prob_all(1, index + 4) + prob_all(1, index));
        curr(1, 2) = binornd(1, p_spr);
        % P(rain|sky, spr, grass) = P(sky, spr, rain, grass) / P(sky, spr, grass)
        index = curr(1, 1) * 8 + curr(1, 2) * 4 + 1;
        p_rain = prob_all(1, index + 2) / (prob_all(1, index + 2) + prob_all(1, index));
        curr(1, 3) = binornd(1, p_rain);
        
        % Copy the values into samples matrix
        spl_dry(t, 1) = curr(1, 1);
        spl_dry(t, 2) = curr(1, 2);
        spl_dry(t, 3) = curr(1, 3);
    end
    
    % Grass = wet
    curr = [binornd(1, 0.5), binornd(1, 0.5), binornd(1, 0.5)];     % Current values
    spl_wet = zeros(1000, 3);
    for t = 1 : 1000
        % Update current values
        % P(sky|spr, rain, grass) = P(sky, spr, rain, grass) / P(spr, rain, grass)
        index = curr(1, 2) * 4 + curr(1, 3) * 2 + 1 + 1;
        p_sky = prob_all(1, index + 8) / (prob_all(1, index + 8) + prob_all(1, index));
        curr(1, 1) = binornd(1, p_sky);
        % P(spr|sky, rain, grass) = P(sky, spr, rain, grass) / P(sky, rain, grass)
        index = curr(1, 1) * 8 + curr(1, 3) * 2 + 1 + 1;
        p_spr = prob_all(1, index + 4) / (prob_all(1, index + 4) + prob_all(1, index));
        curr(1, 2) = binornd(1, p_spr);
        % P(rain|sky, spr, grass) = P(sky, spr, rain, grass) / P(sky, spr, grass)
        index = curr(1, 1) * 8 + curr(1, 2) * 4 + 1 + 1;
        p_rain = prob_all(1, index + 2) / (prob_all(1, index + 2) + prob_all(1, index));
        curr(1, 3) = binornd(1, p_rain);
        
        % Copy the values into samples matrix
        spl_wet(t, 1) = curr(1, 1);
        spl_wet(t, 2) = curr(1, 2);
        spl_wet(t, 3) = curr(1, 3);
    end
    
end

