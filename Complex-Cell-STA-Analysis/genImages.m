function images = genImages(num)
% Generate white noise 50 * 50 images of of given number
    images = zeros(num, 50, 50);
    for i = 1 : num
        images(i, :, :) = rand(50, 50);
    end    
end

