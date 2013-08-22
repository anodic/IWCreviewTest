% Noncentrality parameter
function nonCentPar = simpleChiSqNoncPar(inpData, realRind, vrConInd, vrNonConInd)

    numN = size(inpData, 1);
    sigSq0 = var(inpData(:, vrConInd) - inpData(:, realRind));
    diffsVec = inpData(:, vrNonConInd) - inpData(:, realRind);
    meanDiffsVec = mean(diffsVec);
    muAll = mean(diffsVec);
    sigAll = std(diffsVec);
    
    nonCentPar = numN*muAll/sigAll;
    
    %centDiffsVec = diffsVec - meanDiffsVec;
    %chiSqStat = (1/sigSq0)*sum(centDiffsVec.*centDiffsVec);
end