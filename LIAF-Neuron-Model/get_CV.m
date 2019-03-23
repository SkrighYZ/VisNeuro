function cv = get_CV(isi)
% Get the Coefficient of Variation for the given dataset
    cv = std(isi) / mean(isi);
end

