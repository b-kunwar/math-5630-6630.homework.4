function coeffs = divided_difference(x, y)
    % Input:
    % x - a vector of x values (nodes), size n+1
    % y - a vector of y values, size n+1
    % Output:
    % coeffs - coefficients of the Newton interpolating polynomial
    
    n = length(x) - 1;         % n is the degree of the polynomial
    D = zeros(n+1, n+1);       % Initialize divided difference table
    
    % Set the first column to y values
    D(:, 1) = y(:);            % Copy y values into the first column of D
    
    % Compute divided differences
    for k = 2:n+1              % k is the column index
        for j = k:n+1          % j is the row index, must start from k
            D(j, k) = (D(j, k-1) - D(j-1, k-1)) / (x(j) - x(j-k+1));
        end
    end
    
    % Extract the coefficients from the diagonal of D
    coeffs = diag(D);          % The coefficients for the Newton polynomial
end
