function [fr, mFr, cvFr] = getFR(spkcnt, time)
% Given spike count and time of the network
% Returns the firing rate of each neuron(fr)
% And the mean firing rate of all neurons(mFR)
% And the CV of firing rates(cvFR)

    n = size(spkcnt, 1);
    fr = zeros(n, 1);
    for i = 1 : n
        fr(i, 1) = spkcnt(i, 1) / time;
    end
    mFr = mean(fr);
    cvFr = std(nonzeros(fr)) / mean(nonzeros(fr));
end

