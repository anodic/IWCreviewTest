% runExperiemnt

% Load data
%inpData = xlsread('cntxtRatingsAll.xlsx', 'A2:M148');
%save('4cntxtPlusReal_v02.mat', 'inpData');
load('4cntxtPlusReal_v02.mat', 'inpData');

listOfRelevant = [2,4,7,8,9,10,11,12];
listOfIrrelevant = [1,3,5,6];

%Shapiro-Wilk Normality test
for i=1:(size(inpData,2)-1)
    predictionError = inpData(:,i)-inpData(:,13);
    [h, pValue, W] = swtest(predictionError, 0.05, 0);
    
    if(h~=0)
        disp(['Context ' num2str(i) ' is not normally distributed!']);
    end
    
    
end

for ii = 1:length(listOfIrrelevant)
    for jj = 1:length(listOfRelevant)
        % Compute statistics
        realRind = 13;
        vrConInd = listOfRelevant(jj);
        vrNonConInd = listOfIrrelevant(ii);
        
        pVal = simpleChiSqVar(inpData, realRind, vrConInd, vrNonConInd);
        disp(pVal)
        
        nonCentPar = simpleChiSqNoncPar(inpData, realRind, vrConInd, vrNonConInd);
        disp(nonCentPar);
        
        pValsMatrix(jj,ii)=pVal;
        
        nonCentParMatrix(jj,ii)=nonCentPar;
        
    end
end

kraj=3;


% Compute statistics
% realRind = 13;
% vrConInd = 8;
% vrNonConInd = 3;
%
% pVal = simpleChiSqVar(inpData, realRind, vrConInd, vrNonConInd);
% disp(pVal)
%
% nonCentPar = simpleChiSqNoncPar(inpData, realRind, vrConInd, vrNonConInd);
% disp(nonCentPar);
%


