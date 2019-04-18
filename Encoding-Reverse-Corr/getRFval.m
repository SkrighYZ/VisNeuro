function rfval = getRFval(x, y, phase)
% Get RF value at specific point in the RF
    sigX = 1;
    sigY = 2;
    k = 1 / 0.56;
    part1 = 1 / (2 * pi * sigX * sigY);
    part2 = exp(0 - x^2 / (2 * sigX^2) - y^2 / (2 * sigY^2));
    part3 = cos(k * x - phase);
    rfval = part1 * part2 * part3;
end

