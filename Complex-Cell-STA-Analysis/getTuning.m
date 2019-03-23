function tcurve = getTuning(rf, theta, sqnum)
% Return the Tuning curve on the given RF
% Of grating images of given theta(orientation) sequence 
% sqnum states the squaring function used
    alpha = 0;
    tcurve = zeros(1, length(theta));
    for i = 1 : length(theta)
        image = getImage(alpha, theta(1, i));   % Generate grating image
        tcurve(1, i) = meanR(rf, image, sqnum);
    end
    tcurve = scale(tcurve);
end

