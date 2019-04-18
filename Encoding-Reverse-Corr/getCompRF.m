function compRF = getCompRF(phase1, phase2)
% Return the complex cell RF with the 2 given phases
    compRF = getSimpRF(phase1) + getSimpRF(phase2);
end

