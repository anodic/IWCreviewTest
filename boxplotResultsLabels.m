data = xlsread('D:\00xBeds\03-MatrixFactorizationWithContext\00-RESULTS\CUB-MF\Folding\original-10folds-basicLastColumn-sorted.xlsx');
set(findobj(gca,'Type','text'),'FontSize',30)
%data = xlsread('C:\Users\Ante Odic\Documents\MATLAB\MFresults.xlsx', 'B46:F55');
%boxplot(data, 'labels',{'time','season','weather','social','daytype','location','endEmo','domEmo','mood','physical','decision','interaction','basic MF'})
%set(gca,'XTickLabel',{' '})
boxplot(data)
%boxplot(data, 'labels',{'month','year','social','day','opening','willRec'})