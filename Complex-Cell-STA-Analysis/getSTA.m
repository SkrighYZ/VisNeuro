function sta = getSTA(spikes, images)
% Get the estimated STA from given spike sequence 
% Corresponding to given white noise image sequence
    sta = zeros(50, 50);
    count = 0;
    for i = 1 : length(spikes)
        if spikes(1, i) >= 1        % Choose only images which leads to spikes >= 1
            image = zeros(50, 50);
            for row = 1 : 50
                for col = 1 : 50
                    image(row, col) = images(i, row, col);
                end
            end
            count = count + 1;
            sta = sta + image;
        end
    end
    sta = sta / count;
end

