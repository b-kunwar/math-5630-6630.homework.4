function y_eval = hermite_divided_difference_interpolation(x_nodes, y_data, x_eval)
    % Input:
    % x_nodes - a vector of nodes where each node x_j appears m_j+1 times for each derivative order
    % y_data - a matrix where y_data(j, k+1) represents the k-th derivative of the function at x_nodes(j)
    % x_eval - a vector of points where we want to evaluate the Hermite polynomial
    % Output:
    % y_eval - values of the Hermite polynomial at the points in x_eval
    
    N = length(x_nodes);              % Total number of data points
    D = zeros(N, N);                   % Divided difference table

    % Initialize the first column of D with y_data values (f[z_j])
    D(:, 1) = y_data(:, 1);
    
    % Construct the divided difference table with generalized Hermite conditions
    for k = 2:N                        % Column index, k represents the order of divided difference
        for j = k:N                    % Row index, j is the starting point of each divided difference
            if x_nodes(j) == x_nodes(j-k+1)
                % Use the derivative condition for repeated nodes
                D(j, k) = y_data(j, k) / factorial(k-1);
            else
                % Standard divided difference formula
                D(j, k) = (D(j, k-1) - D(j-1, k-1)) / (x_nodes(j) - x_nodes(j-k+1));
            end
        end
    end
    
    % Extract the coefficients from the diagonal of D for the polynomial
    coeffs = diag(D);

    % Initialize result vector for evaluations
    y_eval = zeros(size(x_eval));
    
    % Evaluate the polynomial at each point in x_eval using Horner's method
    for i = 1:length(x_eval)
        p = x_eval(i);                 % Point to evaluate polynomial at
        val = coeffs(N);               % Start with the last coefficient
        for k = N-1:-1:1
            val = val * (p - x_nodes(k)) + coeffs(k);
        end
        y_eval(i) = val;               % Store the evaluated result
    end
end
