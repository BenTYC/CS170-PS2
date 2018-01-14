# CS171-Gradient-Descent-and-Cross-Validation

Write a function learnlogreg that uses the above gradient descent optimization.  
  
Your function should have the signature w = learnlogreg(X,Y,lambda). Use a constant step size, η, of 0.1. 
As a stopping condition, stop when the size of the gradient (as a vector) falls below 10^−3. 
Assume that the first feature of X (the first column) is a constant (all 1s) and no regularization should be applied to it. 
In class we assumed that the two classes were +1 and -1. You’ll need to write this function to accept Y of +1 and 0.
  
Write a second function err = testlogreg(X,Y,w) which accepts a testing set and learned weights and returns the fraction of examples incorrectly classified.  
  
Use the supplied trainspam.txt, testspam.txt, and loadspdata.m (all the same as last assignment) and test your logistic regression on this testing data. What is the test error rate when training with λ = 0.01? Note, you’ll have to add the column of 1s; the data do not already contain it.  



