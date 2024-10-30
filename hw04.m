% Author: Bikash Kunwar / bzk0067@auburn.edu
% Date: 2024-09-10
% Assignment Name: hw04


classdef hw04
    methods (Static)
        function y = p1(data, eval)
            % Implement the divided difference method to interpolate the data points, then evaluate the polynomial at the given point.
            % :param data: a matrix of size n x 2, where the first column is the x values and the second column is the y values
            % :param eval: a column vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points

            n = size(data, 1);
            y = zeros(size(eval));

            % Write your code here
            y = divided_difference_interpolation(data(:,1),data(:,2),eval);
        end


        function y = p2(data, eval)
            % for 6630 ONLY
            % Implement the divided difference method to interpolate the data
            % points, then evaluate the polynomial at the given point.
            %
            % :param data: a cell array of size n x 1, each cell is a vector
            %              like (x, y0, y1, y2, y3, ..., ym).
            %              y0 = f(x),
            %              y1 = f'(x),
            %              y2 = f''(x),
            %              ... ,
            %              ym = f^{(m)}(x).
            %
            %              Note, different cells may have different lengths.
            %
            % :param eval: a vector of x values at which to evaluate the polynomial
            % :return: a vector of y values corresponding to the evaluation points
            y = hermite_divided_difference_interpolation(data(:,1),data(:,2),eval);

            n = length(data);
            y = zeros(size(eval));

            % write your code here.
            y = hermite_divided_difference_interpolation(data(:,1),data(:,2),eval);

        end
    end
end
