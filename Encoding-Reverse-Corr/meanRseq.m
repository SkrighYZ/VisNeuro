function r = meanRseq(rf, images, sqnum)
% Return the sequence of mean spike rate of given RF 
% in response to the given image sequence
% sqnum states the method of squaring

    r = zeros(1, length(images));
    for i = 1 : size(images, 1)
        image = zeros(50, 50);
        for row = 1 : 50
            for col = 1 : 50
                image(row, col) = images(i, row, col);
            end
        end    
        r(1, i) = meanR(rf, image, sqnum);
    end
    
    r = scale(r);
end

