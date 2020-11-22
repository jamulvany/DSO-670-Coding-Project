%Finds the price given by the prescriptive parametric method given the
%number of data points

function [price,revenue] = presParam(n)

%Define demand model
tau = sqrt(15.1234);
X = normrnd(0,1,n,1);
O = normrnd(0,1,n,1);
V = normrnd(0,1,n,1);
W = normrnd(0,tau,n,1);
Z = 3*X + 3*O + W;
Y = 27.75 - Z.^2 + 6*X.*Z - 9*X.^2 + V + 6*O.*Z - 9*O.^2;

%Regress Z on X
b = regress(Z, [ones(n,1) X O]);

%Find estimates for Z and tau given coefficients from regression
ZHat = b(1) + X*b(2) + O*b(3);
tauHat = sqrt(sum((Z-ZHat).^2)/n);

%Impute propensity score corresponding to each data point
QHat = ( 1/(sqrt(2*pi)*tauHat) )  * exp ( -1/(2*tauHat^2)*(Z-ZHat).^2 );

%Regress Y on Z,Z^2 and log(QHat)
Data = [ones(n,1) Z Z.^2 log(QHat)];
c = regress(Y, Data);

%Given estimate for y(z) yHat(z), optimize Rhat(z)=z*yHat(z) using 1-D grid search
z = linspace(0,5,1000);
optPresIndex = -1;
optPresObj = -100;

for i = 1:length(z)

    yHat = c(1) + c(2)*z(i) + c(3)*z(i)^2  + c(4)*log( ( 1/(sqrt(2*pi)*tauHat) )  * exp ( -1/(2*tauHat^2)*(z(i)-ZHat).^2 ) );

    newObj = z(i)*mean(yHat);
    
    if ( newObj > optPresObj )
        
        optPresObj = newObj;
        optPresIndex = i;
        
    end
end

%return the price and out of sample revenue
price = z(optPresIndex);
revenue = price*(9.75 - price^2);

end

