function i = gen_input(i0, std_dev, size)
% Generate a sequence of inputs according to the Gaussian distribution of
% i0(mean) and given standard deviation, of the given size
    i = normrnd(i0, std_dev, [1, size]);    
end

