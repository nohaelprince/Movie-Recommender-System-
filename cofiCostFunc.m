function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% =============================================================================
% Objective:    Compute the cost function and gradient for collaborative
%               filtering. Concretely, we first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, we implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% We should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
% =============================================================================

Delta = X*Theta' - Y;

% Compute cost function with regularization
J = 0.5*(sum(sum((R.*Delta).^2)) + ...
	lambda*(sum(sum(Theta.^2)) + sum(sum(X.^2))));

% Compute gradients - my vectorized solution
for i = 1:num_movies
   X_grad(i, :) = (R(i, :).*Delta(i, :))*Theta + ...
	lambda*X(i, :);
end

for j = 1:num_users
   Theta_grad(j, :) = (R(:, j).*Delta(:, j))'*X + ...
	lambda*Theta(j, :);
end

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
