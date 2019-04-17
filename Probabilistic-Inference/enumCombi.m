
% Generate probability table of all combinations
% Sky, sprinkler, rain, grass = 0 or 1
% Ex: sky = sunny, spr = off, rain = false, grass = wet
%     index = bin1001 + 1 = dec10
% 2^4 = 16 combinations

prob = zeros(1, 16);
sum_all = 0;
for sky = 0 : 1
    for spr = 0 : 1
        for rain = 0 : 1
            for grass = 0 : 1
                index = sky * 8 + spr * 4 + rain * 2 + grass + 1;
                prob(1, index) = p_combi(sky, spr, rain, grass);
                sum_all = sum_all + prob(1, index);
            end
        end
    end
end

clear sky spr rain grass index;

combi = {'0 0 0 0', '0 0 0 1', '0 0 1 0', '0 0 1 1', '0 1 0 0', '0 1 0 1', '0 1 1 0', '0 1 1 1', ... 
    '1 0 0 0', '1 0 0 1', '1 0 1 0', '1 0 1 1', '1 1 0 0', '1 1 0 1', '1 1 1 0', '1 1 1 1'};
varNames = {'Sky_Sprinkler_Rain_Grass', 'Probability'};
T_combi = table(combi.', prob.', 'VariableNames', varNames);

clear combi varNames;

