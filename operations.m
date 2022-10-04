function [sum, difference, product, max] = operations(num1, num2)
% Takes two numbers and returns the sum, difference, product, and max of
% the two
sum = num1 + num2;
difference = num1 - num2;
product = num1*num2;
max = num1;
if num2 > num1
    max = num2;
end
end