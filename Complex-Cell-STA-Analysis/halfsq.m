function halfsqR = halfsq(r)
% Return the half squared RFt * I
    if r <= 0
        halfsqR = 0;
    else
        halfsqR = r^2;
    end    
end

