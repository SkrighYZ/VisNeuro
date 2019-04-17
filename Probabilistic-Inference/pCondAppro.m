
% By Gibbs sampling
% Generate two tables of probabilities of all combinations of sky, sprinkler, rain 
% Given grass is dry and grass is wet
% Index is given by sky, spr, rain
% Ex: sky = sunny, spr = on, rain = false
%     index = bin110 + 1 = dec7

enumCombi;
clear sum_all T_combi;
[spl_dry, spl_wet] = genGibbsSamples(prob);     % Get samples

cnt_dry = zeros(1, 8);
cnt_wet = zeros(1, 8);
prob_dryAp = zeros(1, 8);
prob_wetAp = zeros(1, 8);
sum_dryAp = 0;
sum_wetAp = 0;

% Loop over each entry of the samples
% Count number of appearance of each 3-tuple combinations 
for t = 1 : 1000
    index = spl_dry(t, 1) * 4 + spl_dry(t, 2) * 2 + spl_dry(t, 3) + 1;
    cnt_dry(1, index) = cnt_dry(1, index) + 1;
    index = spl_wet(t, 1) * 4 + spl_wet(t, 2) * 2 + spl_wet(t, 3) + 1;
    cnt_wet(1, index) = cnt_wet(1, index) + 1;
end

% Calculate the probability
% P(sky, sprinkler, rain|grass=dry) and  P(sky, sprinkler, rain|grass=wet)
for i = 1 : 8
    prob_dryAp(1, i) = cnt_dry(1, i) / 1000;
    sum_dryAp = sum_dryAp + prob_dryAp(1, i);
    prob_wetAp(1, i) = cnt_wet(1, i) / 1000;
    sum_wetAp = sum_wetAp + prob_wetAp(1, i);
end


clear i t prob index cnt_dry cnt_wet;

varNames = {'Sky_Sprinkler_Rain', 'Probability'};
combi_dry = {'0 0 0', '0 0 1', '0 1 0', '0 1 1', '1 0 0', '1 0 1', '1 1 0', '1 1 1'};
T_dryAp = table(combi_dry.', prob_dryAp.', 'VariableNames', varNames);
combi_wet = {'0 0 0', '0 0 1', '0 1 0', '0 1 1', '1 0 0', '1 0 1', '1 1 0', '1 1 1'};
T_wetAp = table(combi_wet.', prob_wetAp.', 'VariableNames', varNames);

clear combi_dry combi_wet varNames;
