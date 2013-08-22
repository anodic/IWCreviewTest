data = xlsread('D:\00xBeds\03-MatrixFactorizationWithContext\00-RESULTS\CUB-MF\Folding\original-10folds-basicLastColumn.xlsx');
%data = xlsread('D:\00xBeds\03-MatrixFactorizationWithContext\00-RESULTS\CUB-MF\preRMSE\LDOSsquaredDifferencesPreRMSEfold1_cub.xlsx');
relevantCntxt = [2 4 7 8 9 10 11 12];
irrelevantCntxt = [1 3 5 6];
basicMF = 13;
AVG = 14;
result(1).combination = '0';
result(1).diffs = 0;
result(1).pValFromZero = 0;

combinationNum = 1;
boxplotNum =1;
boxplotData = zeros(size(data,1),1);
basicVScontext = zeros(10,12);
avgVScontext = zeros(10,12);

diffPvalsFormZero = zeros(8,4);

for k = 1:12
    basicVScontext(:,k) = data(:,basicMF)-data(:,k);
end
figure, boxplot(basicVScontext);
h = findobj(gca,'Tag','Box');

for c = 1: length(relevantCntxt)
    currentBox = 13 - relevantCntxt(c);
    patch(get(h(currentBox),'XData'),get(h(currentBox),'YData'),'g','FaceAlpha',.5);
end





set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12])
set(gca,'XTickLabel',{'t' 'day' 'sea' 'loc' 'wea' 'soc' 'end' 'dom' 'md' 'phy' 'dec' 'int'})
set(gca,'FontSize',12)






refline(0,0)

%xlabel('Context variables', 'FontSize',18);
ylabel('RMSE difference', 'FontSize',16);

for kk = 1:12
    avgVScontext(:,kk) = data(:,AVG)-data(:,kk);
end

figure, boxplot(avgVScontext);
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12])
set(gca,'XTickLabel',{'t' 'day' 'sea' 'loc' 'wea' 'soc' 'end' 'dom' 'md' 'phy' 'dec' 'int'})
set(gca,'FontSize',12)

refline(0,0)

%xlabel('Context variables', 'FontSize',18);
ylabel('RMSE difference', 'FontSize',16);


for i = 1:length(irrelevantCntxt)
   for j=1:length(relevantCntxt) 
       
    result(combinationNum).combination = [num2str(irrelevantCntxt(i)) '-' num2str(relevantCntxt(j))]
    result(combinationNum).diffs = data(:,irrelevantCntxt(i)) - data(:,relevantCntxt(j));
    result(combinationNum).pValFromZero = signtest(result(combinationNum).diffs)
    diffPvalsFormZero(j,i) = result(combinationNum).pValFromZero;
    
    
    
    boxplotData(:,boxplotNum) = result(combinationNum).diffs;
    boxplotNum = boxplotNum+1;
    
    
    
    combinationNum = combinationNum + 1;
   end    
   figure, boxplot(boxplotData);
   set(gca,'XTick',[1 2 3 4 5 6 7 8])
set(gca,'XTickLabel',{'day' 'loc' 'end' 'dom' 'md' 'phy' 'dec' 'int'})
set(gca,'FontSize',15)
   
   
   refline(0,0)
   %set(gca,'FontSize',14);
   %xlabel('Relevant context variables', 'FontSize',18);
   ylabel('RMSE difference', 'FontSize',18);

   boxplotNum = 1;
   boxplotData = zeros(size(data,1),1);
end

stoping=3;