function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Mackenzie Hoey
%
%         DUE: November 17
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level # 
moderate = 2;               % moderate level # 
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

if level ~= beginner && level ~= moderate && level ~= advanced % Bug found: 
    % I ran to test the three conditions and got the invalid message for 
    % correct inputs. Once changed the 'while' to an 'if'
    % statement I only moved onto the game with the second case. I
    % changed it to 'and' instead of 'or' for it to work
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner 

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest; % Bug found: I found this by trying to run the 
                            % advanced condition and getting an error that 
                            % 'advancedhighest' was not variable
end

% randomly select secret number between 1 and highest for level of play

secretNumber = randi(highest); % Bug found: I found this by running the 
                                % code without the semicolon
                                % to display the secretNumber and saw it
                                % was always the highest. I changed it to
                                % randi to generate the secret number. 

% initialize number of guesses and User_guess

numOfTries = 0; % Bug found: I found this by running the code and correctly guessing
                % in 2 tries, but it displayed that I guessed in 3. I
                % changed the initial number of tries to 0 instead of 1. 
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest);
userGuess = input('');
while userGuess < 1 || userGuess > highest % Bug found: I guessed the highest possible 
                                           % guess and got the message that
                                           % it was an invalid guess. I
                                           % changed '>=' to '>'

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

% add 1 to the number of guesses the user has made

numOfTries = numOfTries + 1;

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber % Bug found: I got the error that the elseif statement 
                            % would never run because there was the '>'
                            % condition twice. I changed it to '<'
fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber,numOfTries); % Bug found: I found this by running the game 
                % while displaying the secret number, so I knew what to guess. 
                % I saw the display message didn't display the number of 
                % tries it took to correctly guess. 


fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop
end % Bug found: I ran the code and got an error that there was a missing 'end',
% so I added and end to close while loop

% end of game