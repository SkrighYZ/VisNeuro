function p = p_rain_given_sky(rain, sky)
	% Returns P(rain|sky) with given rain and sky values
	% rain = 0(false) or 1(true)
	% sky = 0(cloudy) or 1(sunny)

	% Sky = cloudy, sky = sunny
	table_rain_given_sky = [[0.3, 0.99], 		% Rain = false
							[0.7, 0.01]];       % Rain = true
	p = table_rain_given_sky(rain + 1, sky + 1);
end

