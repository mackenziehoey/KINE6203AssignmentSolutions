function countUp(num1, num2)
% Takes 2 numbers as input and displays a counter from the
% lower number to the higher number
inputs = [num1,num2];
lower = min(inputs);
upper = max(inputs);
for i = lower:upper
    disp(i)
    pause(1)
end
end