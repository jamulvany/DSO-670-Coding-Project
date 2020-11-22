function [price,revenue] = presParam(n)


tau = sqrt(15.1234);
confound = 3;

X = normrnd(0,1,n,1);
V = normrnd(0,1,n,1);
W = normrnd(0,tau,n,1);
Z = confound*X + W;
Y = 27.75 - Z.^2 + 6*X.*Z - 9*X.^2 + V;


b = regress(Z, [ones(n,1) X]);

ZHat = b(1) + X*b(2);
tauHat = sqrt(15.1234);
muHat = mean(Z);

QHat = ( 1/(sqrt(2*pi)*tauHat) )  * exp ( -1/(2*tauHat^2)*(Z-ZHat).^2 );

Data = [ones(n,1) Z.^2 log(QHat)];
c = regress(Y, Data);


z = linspace(0,5,1000);
optPresIndex = -1;
optPresObj = -100;

for i = 1:length(z)

    yHat = c(1) + c(2)*z(i)^2  + c(3)*log( ( 1/(sqrt(2*pi)*tauHat) )  * exp ( -1/(2*tauHat^2)*(z(i)-ZHat).^2 ) );

    newObj = z(i)*mean(yHat);
    
    if ( newObj > optPresObj )
        
        optPresObj = newObj;
        optPresIndex = i;
        
    end
end

price = z(optPresIndex);
revenue = price*(18.75 - price^2);

end

