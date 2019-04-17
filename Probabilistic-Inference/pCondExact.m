
% By exact inference
% Generate two tables of probabilities of all combinations of sky, sprinkler, rain 
% Given grass is dry and grass is wet
% Index is given by sky, spr, rain
% Ex: sky = sunny, spr = on, rain = false
%     index = bin110 + 1 = dec7

prob_dryEx = zeros(1, 8);
prob_wetEx = zeros(1, 8);
sum_dryEx = 0;
sum_wetEx = 0;

% Calculate the probability
% P(sky, sprinkler, rain|grass=dry) and  P(sky, sprinkler, rain|grass=wet)
for sky = 0 : 1
	for spr = 0 : 1
		for rain = 0 : 1
			index = sky * 4 + spr * 2 + rain + 1;
			prob_dryEx(1, index) = p_given_grass(sky, spr, rain, 0);
			prob_wetEx(1, index) = p_given_grass(sky, spr, rain, 1);
			sum_dryEx = sum_dryEx + prob_dryEx(1, index);
			sum_wetEx = sum_wetEx + prob_wetEx(1, index);
		end
	end
end


clear sky spr rain index;

varNames = {'Sky_Sprinkler_Rain', 'Probability'};
combi_dry = {'0 0 0', '0 0 1', '0 1 0', '0 1 1', '1 0 0', '1 0 1', '1 1 0', '1 1 1'};
T_dryEx = table(combi_dry.', prob_dryEx.', 'VariableNames', varNames);
combi_wet = {'0 0 0', '0 0 1', '0 1 0', '0 1 1', '1 0 0', '1 0 1', '1 1 0', '1 1 1'};
T_wetEx = table(combi_wet.', prob_wetEx.', 'VariableNames', varNames);

clear combi_dry combi_wet varNames;

