function image = getImage(phase, theta)
% Get image of degrees from -5 to 5 with pixels of 0.2 * 0.2 deg^2 
% Of given phase and orientation
    image = zeros(50);
    for i = 1 : 50
        for j = 1 : 50
            x = -5 + i * 0.2;
            y = -5 + j * 0.2;
            image(j, i) = getImval(x, y, phase, theta);
        end
    end
end

