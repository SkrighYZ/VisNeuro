function rf = getSimpRF(phase)
% Get RF of degrees from -5 to 5 with pixels of 0.2 * 0.2 deg^2
    rf = zeros(50);
    for i = 1 : 50
        for j = 1 : 50
            x = -5 + i * 0.2;
            y = -5 + j * 0.2;
            rf(j, i) = getRFval(x, y, phase);
        end
    end    
end

