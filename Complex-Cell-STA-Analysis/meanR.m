function r = meanR(rf, image, sqnum)  
% Calculate the unscaled mean spike rate from given RF and image 

    colRF = reshape(rf.', [], 1);      % Turn RF into column vector
    colI = reshape(image.', [], 1);    % Turn I into column vector
    tcolRF = colRF.';                  % colRF transpose
    
    if sqnum == 1
        r = halfsq(tcolRF * colI);
    else 
        r = fullsq(tcolRF * colI);
    end
end

