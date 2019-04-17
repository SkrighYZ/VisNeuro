function p = p_combi(sky, spr, rain, grass)
% Return the probability of any combinations of variables
% Using bayesian techniques on graphical models
% P(sky, spr, rain, grass) = P(sky) * P(rain|sky) * P(spr|sky) * P(grass|rain, spr)
% sky = 0(cloudy) or 1(sunny)
% spr = 0(off) or 1(on)
% rain = 0(false) or 1(true)
% grass = 0(dry) or 1(wet)
% rain_spr = 00 or 01 or 10 or 11
	rain_spr = rain * 2 + spr;
    
    if sky == 0
        p_sky = 0.5;
    else
        p_sky = 0.5;
    end
 
	p1 = p_rain_given_sky(rain, sky);
	p2 = p_spr_given_sky(spr, sky);
	p3 = p_grass_given_rain_spr(grass, rain_spr);
	p = p_sky * p1 * p2 * p3;
end
