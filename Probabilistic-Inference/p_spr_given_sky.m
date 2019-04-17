function p = p_spr_given_sky(spr, sky)
    % Returns P(spr|sky) with given spr and sky values
    % spr = 0(off) or 1(on)
    % sky = 0(cloudy) or 1(sunny)
    
	% Sky = cloudy, sky = sunny
	table_spr_given_sky = [[0.5, 0.1], 		% Sprinkler = off
						   [0.5, 0.9]];     % Sprinkler = on
	p = table_spr_given_sky(spr + 1, sky + 1);
end