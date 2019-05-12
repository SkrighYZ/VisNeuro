function [cv, meanCV] = getISI(spks, spkcnt)
% Given binary spike sequence and spike count for each neuron
% Returns the CV of ISIs for each neuron and their mean

    n = size(spkcnt, 1);
    dt = 1;
    bins = size(spks, 2);
    cv = zeros(n, 1);
    
    for i = 1 : n
        if spkcnt(i, 1) < 10
            continue
        else
            isi = zeros(1, spkcnt(i, 1));
            time = 0;
            cnt = 1;
            for t = 1 : bins
                time = time + dt;
                if spks(i, t) == 1
                    isi(1, cnt) = time;
                    time = 0;
                    cnt = cnt + 1;
                end
            end
        end
        cv(i, 1) = std(isi) / mean(isi);
    end
    
    meanCV = mean(nonzeros(cv));
end

