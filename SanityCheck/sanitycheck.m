
m = 100; %number of iterations
n = [10 50 100 500 1000]; %set vector of number of data points
avgRevenuePred = zeros(length(n),1); %for storing average revenues for each n(i)
avgRevenuePres = zeros(length(n),1);

for i=1:length(n)  
    
    rPred = zeros(m,1); %initialize for storage of revenues from each method
    rPres = zeros(m,1);
    
    for j=1:m
    
        [~, rPred(j)] = predParam(n(i)); %for each iteration returns revenue from prediction/prescription methods
        [~, rPres(j)] = presParam(n(i));    

    end
    
    avgRevenuePred(i) = mean(rPred); %for each n we take the averages and store
    avgRevenuePres(i) = mean(rPres);
    
end

%make plots
plot(n,31.25*ones(length(n),1))
hold on
plot(n,avgRevenuePred)
plot(n,avgRevenuePres)
ylabel('Out of Sample Revenue') 
xlabel('Sample Size') 
legend('Optimal','Predictive Parametric','Prescriptive Parametric','Location','southeast')
hold off




