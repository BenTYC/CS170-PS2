function run3
tic
%[trainX,trainY] = loadspdata('toytrain.txt',3);
%[testX,testY] = loadspdata('toytest.txt',3);
[trainX,trainY] = loadspdata('spamtrain.txt',100);
[testX,testY] = loadspdata('spamtest.txt',100);
lambdaset = logspace(-5,1,10);
plotlogregerr(trainX,trainY,testX,testY,lambdaset);
toc



