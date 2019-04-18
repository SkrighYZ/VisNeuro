function isi = expISI(time)
% Return exponential random ISI's to fill in given time
% Time has unit in seconds
    p = 10;
    miu = 1 / p;        % Mean of ISI
    temp = zeros(1, round(time / miu * 2));   % Double size of ISI's needed in case out of bound      
    tpassed = 0;
    count = 0;      % Count how many ISI's data is needed to add up to given time
    
    while tpassed <= time 
        count = count + 1;
        temp(1, count) = exprnd(miu);
        tpassed = tpassed + temp(1, count);
    end
    
    isi = zeros(1, count);       % Now we know the size to create the return vector
    for i = 1 : count
        isi(1, i) = temp(1, i);
    end    
end

