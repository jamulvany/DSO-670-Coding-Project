%This script generates the plots for experiment 2
%It repeatedly calls functions presParam and predParam to generate revenues
%for each method. Then it plots the mean revenues for each std dev tau



n = 1000; %number of data points
m = 100;  %number of iterations

tau = linspace(1,20,10); %create vector of std deviations

avgRevenuePred = zeros(length(tau),1); %initialize vector storing averages
avgRevenuePres = zeros(length(tau),1);


for i=1:length(tau)  
    
    rPred = zeros(m,1);
    rPres = zeros(m,1);
    
    for j=1:m
    
        [~, rPred(j)] = predParam(n,tau(i));   %for each iterations returns revenue from prediction/prescription methods
        [~, rPres(j)] = presParam(n,tau(i));    

    end
    
    avgRevenuePred(i) = mean(rPred); %for each tau we take the averages and store
    avgRevenuePres(i) = mean(rPres);
    
end


%make plots
plot(tau,31.25*ones(length(tau),1))
hold on
plot(tau,avgRevenuePred)
plot(tau,avgRevenuePres)
ylabel('Out of Sample Revenue') 
xlabel('tau') 
legend('Optimal','Predictive Parametric','Prescriptive Parametric','Location','southeast')
hold off



