function y_eval = divided_difference_interpolation(x, y, x_eval)
    % Rewrote the argument name for ease 
    % Input:
    % x - a vector of x values (nodes), size n+1
    % y - a vector of y values, size n+1
    % x_eval - column vector of x values to evaluate the polynomial at
    % Output:
    % y_eval - column vector of polynomial evaluations at x_eval points
    
    n = length(x) - 1;           % n is the degree of the polynomial
    D = zeros(n+1, n+1);         % Initialize divided difference table
    
    % Set the first column to y values
    D(:, 1) = y(:);              % Copy y values into the first column of D
    
    % Compute divided differences
    for k = 2:n+1                % k is the column index
        for j = k:n+1            % j is the row index, must start from k
            D(j, k) = (D(j, k-1) - D(j-1, k-1)) / (x(j) - x(j-k+1));
        end
    end
    
    % Extract the coefficients from the diagonal of D
    coeffs = diag(D);            % The coefficients for the Newton polynomial
    
    % Initialize result vector for evaluations
    y_eval = zeros(size(x_eval));  
    
    % Evaluate the polynomial at each point in x_eval using Horner's method
    for i = 1:length(x_eval)
        % Horner's method for Newton's form of polynomial evaluation
        p = x_eval(i);           % Point to evaluate polynomial at
        val = coeffs(n+1);       % Start with the last coefficient
        for k = n:-1:1
            val = val * (p - x(k)) + coeffs(k);
        end
        y_eval(i) = val;         % Store the evaluated result
    end
end
