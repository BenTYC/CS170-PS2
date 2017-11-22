% CS171   PS2
% Name: Tsung-Ying Chen 
% SID: 861310198 
% Date: 10/27/2017 
function w = learnlogreg(X,Y,lambda)

n = size(X,2) + 1;          %for 1st col = 1
m = size(X,1);

Y(find(~Y))=-1;             %Y: 0 -> -1
X = [ones(m,1) X];          %X: 1st col = 1
lambda_m = lambda*eye(n);
lambda_m(1,1) = 0;
eta = 0.1;

w = rand(n,1);
delw = 1;
g = 1;

while norm(g) >= 1e-3
%while delw * delw' >= 1e-6
	delw = 0;
    for i = 1:m
        pi = 1/(1+exp(-Y(i)*X(i,:)*w));
        g = 2*(lambda_m*w)'/m - (1-pi)*Y(i)*X(i,:);
        delw = delw + eta * g;
        w = w - eta * g';
    end
end
end

