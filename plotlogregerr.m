% CS171   PS2
% Name: Tsung-Ying Chen 
% SID: 861310198 
% Date: 10/27/2017 
function plotlogregerr(trainX,trainY,testX,testY,lambdaset)

k_fold = 5;
lambda_n = length(lambdaset);
fold_size = size(trainY,1)/k_fold;

%%%Training%%%%
err_avg_train = lambdaset;

for i = 1 : lambda_n
    err_cumul = 0;
    for j = 1 : k_fold
        train_X = trainX;
        train_Y = trainY;
        valid_X = train_X(1+(j-1)*fold_size: j*fold_size,:);
        valid_Y = train_Y(1+(j-1)*fold_size: j*fold_size,:);
        train_X(1+(j-1)*fold_size: j*fold_size,:) = [];
        train_Y(1+(j-1)*fold_size: j*fold_size,:) = [];
        w = learnlogreg(train_X,train_Y,lambdaset(i));
        err = testlogreg(valid_X,valid_Y,w);
        err_cumul = err_cumul + err;
        %fprintf('lambda = %g     i = %d~%d    err = %g\n',lambdaset(i),1+(j-1)*fold_size, j*fold_size, err);
    end
    err_avg_train(i) = err_cumul/k_fold;
    fprintf('lambda = %g       err = %g\n',lambdaset(i), err_avg_train(i));
end


%%%Testing%%%%
err_avg_test = lambdaset;
fold_size = floor(size(testY,1)/k_fold);

for i = 1 : lambda_n
    err_cumul = 0;
    for j = 1 : k_fold
        test_X = testX;
        test_Y = testY;
        valid_X = test_X(1+(j-1)*fold_size: j*fold_size,:);
        valid_Y = test_Y(1+(j-1)*fold_size: j*fold_size,:);
        test_X(1+(j-1)*fold_size: j*fold_size,:) = [];
        test_Y(1+(j-1)*fold_size: j*fold_size,:) = [];
        w = learnlogreg(test_X,test_Y,lambdaset(i));
        err = testlogreg(valid_X,valid_Y,w);
        err_cumul = err_cumul + err;
        %fprintf('lambda = %g     i = %d~%d    err = %g\n',lambdaset(i),1+(j-1)*fold_size, j*fold_size, err);
    end
    err_avg_test(i) = err_cumul/k_fold;
    fprintf('lambda = %g       err = %g\n',lambdaset(i), err_avg_test(i));
end

%%%Plot loglog%%%%%
loglog(lambdaset,err_avg_train, '-s',lambdaset,err_avg_test, '-s')
grid on
legend('Validation error','Test error');

end


