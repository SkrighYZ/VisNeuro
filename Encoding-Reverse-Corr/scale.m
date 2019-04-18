function scaledR = scale(r)
% Scale mean spike rate sequence r to 50 max
    max = r(1, 1);
    
    for rate = r
        if rate > max
            max = rate;
        end    
    end    
    
    r0 = 50 / max;
    scaledR = r0 * r;
end

