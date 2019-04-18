function r = getGratR(rf, alpha, sqnum)
% Return sequence of mean spike rate with given RF 
% In response to grating images with given sequence of phases
% sqnum states the squaring function we use
    theta = 0;      
    r = zeros(1, length(alpha));
    for i = 1 : length(alpha)
        image = getImage(alpha(1, i), theta);   % Generate grating image
        r(1, i) = meanR(rf, image, sqnum);
    end 
    r = scale(r);
end

