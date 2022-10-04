function response = oddOrEven(num1,num2)
% Takes 2 numbers as inputs and returns 'Woo' if their sum is even or 
% 'Hah' if their sum is odd
sum = num1 + num2;
if mod(sum,2) == 1
    response = 'Hah';
else
    response = 'Woo';
end
end