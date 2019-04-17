pCondAppro;
clear prob_dryAp prob_wetAp sum_dryAp sum_wetAp T_dryAp T_wetAp;

corr_dry = corrcoef(spl_dry);
corr_wet = corrcoef(spl_wet);

varNames = {'Correlation', 'Sky', 'Sprinkler', 'Rain'};
comp = {'Sky', 'Sprinkler', 'Rain'};
T_corr_dry = table(comp.', corr_dry(1,:).', corr_dry(2,:).', corr_dry(3,:).', 'VariableNames', varNames);
T_corr_wet = table(comp.', corr_wet(1,:).', corr_wet(2,:).', corr_wet(3,:).', 'VariableNames', varNames);

clear comp varNames;