function p = p_given_grass(sky, spr, rain, grass)
    % Returns P(sky, spr, rain|grass) 
    % sky = 0(cloudy) or 1(sunny)
    % spr = 0(off) or 1(on)
    % rain = 0(false) or 1(true)
    % grass = 0(dry) or 1(wet)

	% P(sky, spr, rain, grass)
	p_all = p_combi(sky, spr, rain, grass);

	% P(grass) = Sum(sky, spr, rain) of P(grass, sky, spr, rain)
	p_grass = 0;
	for sky = 0 : 1
        for spr = 0 : 1
            for rain = 0 : 1
                p_grass = p_grass + p_combi(sky, spr, rain, grass);
            end
        end
	end

	% P(sky, spr, rain|grass)
	% = P(sky, spr, rain, grass) / P(grass)
	p = p_all / p_grass;
end
