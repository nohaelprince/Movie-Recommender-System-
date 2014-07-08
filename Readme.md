# Movie Recommender System

## Collaborative Filtering

We will implement the collaborative filtering learning algorithm and apply it to a dataset of movie ratings.1 This dataset consists of ratings on a scale of 1 to 5. The dataset has nu = 943 users, and nm = 1682 movies

This implementation is writtrn in Octave.

The main.m is the main script file.


## Collaborative filtering cost function

The function cofiCostFunc.m computes the collaborative fitlering objective function and gradient. After implementing the cost function and gradient, we use fmincg.m to learn the parameters for collaborative filtering.

The first part of the script main.m will load the dataset movies.mat, providing the variables Y and R in your Octave environment.

The matrix Y (a num movies x num users matrix) stores the ratings y(i;j) (from 1 to 5). The matrix R is an binary-valued indicator matrix, where R(i; j) = 1 if user j gave a rating to movie i, and R(i; j) = 0 otherwise. 

The objective of collaborative filtering is to predict movie ratings for the movies that users have not yet rated, that is, the entries with R(i; j) = 0. This will allow us to recommend the movies with the highest predicted ratings to the user.

The script main.m will compute the average movie rating for the first movie (Toy Story) and output the average rating to the screen.

cofiCostFunc.m to compute the cost function and gradient for collaborative filtering. Note that the parameters to the function (i.e., the values that you are trying to learn) are X and Theta. In
order to use an off-the-shelf minimizer such as fmincg, the cost function has been set up to unroll the parameters into a single vector params. 

## Regularized cost function


We add regularization to the computations of the cost function, J. The script main.m will run the regularized cost function.

After we have implemented the regularized cost function, we implement regularization for the gradient. cofiCostFunc.m will return the regularized gradient by adding the contributions from the regularization terms.

## Regularized gradient

After computing the gradients, the script main.m will run another gradient check (checkCostFunction) to numerically check the implementation of our gradients.

## Learning movie recommendations

After implementing the collaborative filtering cost function
and gradient, I started training the algorithm to make movie
recommendations for myself.

In main.m script, I enter my own movie preferences, so that later when the algorithm runs, I can get my own movie recommendations! 
I have filled out some values according to my own preferences, but can be changed this according to changing tastes.

The list of all movies and their number in the dataset can be found listed in the file movie idx.txt.


After the additional ratings have been added to the dataset, the script will proceed to train the collaborative filtering model. This will learn the parameters X and Theta. 

To predict the rating of movie i for user j, you need to compute (theta^(j))^T x^(i). The next part of the script computes the ratings for all the movies and users and displays the movies that it recommends (Figure 4), according to ratings that were entered earlier in the script. 

- Note that
you might obtain a different set of the predictions due to different random initializations.
