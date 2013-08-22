% runExperiemnt

% Load data
inpData = xlsread('cntxtRatingsAll.xlsx', 'A2:M148'); 
save('4cntxtPlusReal_v02.mat', 'inpData');
%load('4cntxtPlusReal_v02.mat', 'inpData');



% Compute statistics
realRind = 13;
vrConInd = 8;
vrNonConInd = 3;

pVal = simpleChiSqVar(inpData, realRind, vrConInd, vrNonConInd);
disp(pVal)

nonCentPar = simpleChiSqNoncPar(inpData, realRind, vrConInd, vrNonConInd);
disp(nonCentPar);



