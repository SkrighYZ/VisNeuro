function p = p_grass_given_rain_spr(grass, rain_spr)
	% Returns P(grass|rain, spr) with given grass, rain, spr values
	% spr = 0(off) or 1(on)
	% rain = 0(false) or 1(true)
	% grass = 0(dry) or 1(wet)
    
	% rain_spr = 00 or 01 or 10 or 11
	% Ex: rain = false, spr = on
    %     column index = bin01 + 1 = dec2
	table_grass_given_rain_spr = [[0.99, 0.1, 0.1, 0.01], 		% Grass = dry
								  [0.01, 0.9, 0.9, 0.99]];      % Grass = wet
	p = table_grass_given_rain_spr(grass + 1, rain_spr + 1);
end