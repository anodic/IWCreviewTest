data = xlsread('D:\00xBeds\03-MatrixFactorizationWithContext\00-RESULTS\CIB-MF\Folding\ldos-10folds-cib-basicLastColumn.xlsx')

boxplot(data);


resultsMatrixp=0;
resultsMatrixh=0;
for i = 1:13
    for j = 1:13

        [p h] = signrank(data(:,i),data(:,j));
        
        resultsMatrixp(i,j)=p;
        resultsMatrixh(i,j)=h;
        
    end
end
