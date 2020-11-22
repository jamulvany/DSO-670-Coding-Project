%Finds the price given by the prediction parametric method given the
%number of data points and the coefficient c in Z = c*X+W

function [price,revenue] = predParam(n,c)

%Define demand model
tau = sqrt(15.1234);
X = normrnd(0,1,n,1);
V = normrnd(0,1,n,1);
W = normrnd(0,tau,n,1);
Z = c*X + W;
Y = 27.75 - Z.^2 + 6*X.*Z - 9*X.^2 + V;


%Regress Y on Z,Z^2
D = [ ones(n,1) Z Z.^2];
beta = regress(Y,D); 

%Given estimate for y(z) yHat(z), optimize Rhat(z)=z*yHat(z) using 1-D grid search
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

%return the price and out of sample revenue
price = z(optPredIndex);
revenue = price*(18.75 - price^2);

end

