% CS171   PS2
% Name: Tsung-Ying Chen 
% SID: 861310198 
% Date: 10/27/2017 
function err = testlogreg(X,Y,w)

m = size(X,1);
X = [ones(m,1) X];   %X: 1st col = 1
predY = zeros(m,1);

for i = 1:m
    if X(i,:)*w < 0
        predY(i,1) = 0;
    else
        predY(i,1) = 1;
    end
end

err = 1 - sum(predY == Y)/size(Y,1);

end


