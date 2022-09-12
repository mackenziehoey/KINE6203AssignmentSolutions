function userInput = welcomeMessage(~)
    disp('Welcome to tic tac toe. Would you like to play a game?');
    userInput = input('Enter y/n: ', 's');
end

userAnswer = welcomeMessage(~);
