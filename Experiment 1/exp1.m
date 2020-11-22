%This script generates the plot for experiment 1
%It repeatedly calls functions presParam and predParam to generate revenues
%for each method. Then it plots the mean revenues for each coefficient c in
%a range from 0 to 5

n = 1000; %number of data points
m = 100; %number of iterations

c = linspace(0,5,10); %create vector of coefficients c

avgRevenuePred = zeros(length(c),1); %initialize vector storing averages
avgRevenuePres = zeros(length(c),1);

for i=1:length(c)  

    rPred = zeros(m,1); %initialize for storage of revenues from each method
    rPres = zeros(m,1);
    
    for j=1:m
    
        [~, rPred(j)] = predParam(n,c(i)); %for each iteration returns revenue from prediction/prescription methods
        [~, rPres(j)] = presParam(n,c(i));    

    end
    
    avgRevenuePred(i) = mean(rPred); %for each tau we take the averages and store
    avgRevenuePres(i) = mean(rPres);
    
end

%make plots
plot(c,31.25*ones(length(c),1))
hold on
plot(c,avgRevenuePred)
plot(c,avgRevenuePres)
ylabel('Out of Sample Revenue') 
xlabel('c') 
legend('Optimal','Predictive Parametric','Prescriptive Parametric','Location','southwest')
hold off


