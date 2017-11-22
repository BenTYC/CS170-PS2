function run
tic
%[trainX,trainY] = loadspdata('toytrain.txt',3);
%[testX,testY] = loadspdata('toytest.txt',3);
[trainX,trainY] = loadspdata('spamtrain.txt',100);
[testX,testY] = loadspdata('spamtest.txt',100);
lambda = 0.01;
w = learnlogreg(trainX,trainY,lambda);
%disp(w);

err = testlogreg(testX,testY,w);
fprintf('lambda = %g       err = %g\n',lambda, err);
%disp(err);
toc



