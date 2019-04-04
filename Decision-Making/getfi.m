function fi = getfi(inputOrient, orienti, c, k, fmax)
% Get the populatiton response for specific neuron orientation(orienti) over input
% orientation(inputOrient)
% inputOrient in degrees, orient for specific neuron in radians 
    inputOrient = deg2rad(inputOrient);
    f0 = 5;
    fi = f0 + c * fmax * exp(k * (cos(2 * (inputOrient - orienti)) - 1)); 
end

