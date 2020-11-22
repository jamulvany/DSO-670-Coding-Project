function [price,revenue] = predParam(n)


tau = sqrt(15.1234);
confound = 3;

X = normrnd(0,1,n,1);
V = normrnd(0,1,n,1);
W = normrnd(0,tau,n,1);
Z = confound*X + W;
Y = 27.75 - Z.^2 + 6*X.*Z - 9*X.^2 + V;
D = [ ones(n,1) Z Z.^2];

beta = regress(Y,D); 


z = linspace(0,5,1000);
optPredIndex = -1;
optPredObj = -100;

for i = 1:length(z)

    yHat = beta(1) + beta(2)*z(i) + beta(3)*z(i)^2;

    newObj = z(i)*yHat;
    
    if ( newObj > optPredObj )
        
        optPredObj = newObj;
        optPredIndex = i;
        
    end
end

price = z(optPredIndex);
revenue = price*(18.75 - price^2);


end

