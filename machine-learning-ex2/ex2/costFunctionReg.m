function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


g_X_theta = sigmoid(X*theta);  % m*1
p1=-y' * log(g_X_theta);
p2=(1-y)'*log(1-g_X_theta);
J=(1/m)* (p1-p2) + lambda/(2*m)*theta(2:size(theta))'*theta(2:size(theta)); ;

reg = theta.*lambda/m;
reg(1) = 0;
grad = (1/m)*((sigmoid(X * theta) - y)' * X)' + reg;



% =============================================================

end
