% Simpe ChiSq test for Var
function pVal = simpleChiSqVar(inpData, realRind, vrConInd, vrNonConInd)

    numN = size(inpData, 1);
    sigSq0 = var(inpData(:, vrConInd) - inpData(:, realRind));
    diffsVec = inpData(:, vrNonConInd) - inpData(:, realRind);
    meanDiffsVec = mean(diffsVec);
    centDiffsVec = diffsVec - meanDiffsVec;
    chiSqStat = (1/sigSq0)*sum(centDiffsVec.*centDiffsVec);
    pVal = 1-cdf('chi2', chiSqStat, numN-1);

end