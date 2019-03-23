function imval = getImval(x, y, phase, theta)
% Get image value at given point with given phase and orientation
% Theta = 0 if image is vertical
    k = 1 / 0.56;
    imval = sin(k * (x * cos(theta) + y * sin(theta)) - phase);
end

