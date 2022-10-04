% Author: Mackenzie Hoey
% Date: October 6, 2022
% 
% The following code prompts the user to play a game of 
% tic tac toe with the computer.
% 

% Welcome screen asking user if they want to play.
disp('Welcome to tic tac toe. Would you like to play a game?');
userInput = input('Enter y/n: ', 's');

% Cases to user's input (yes/no/invalid response)
while userInput ~= ('y')
    if userInput == 'n'
        disp('See you next time!');
        return;
    else
        userInput = input('Invalid response. Enter y or n: ','s');
    end
end

% Play game if user input is 'y'
playGame

function playGame()
% function to start the game

% Prompt the user to make the first move
disp("It's your turn first!")

% empty array for buttons
button = matlab.ui.control.UIControl.empty(3,0);

% empty board to track plays
global trackPlayed
trackPlayed = zeros(3);

%Creates the game grid
fig = figure('NumberTitle', 'off', 'Name', 'Game');
board = uipanel(fig, 'Title','Tic Tac Toe', ...
               'BackgroundColor', 'white',...
             'Position',[.01 .01 .98 .98]);

%Creates panels and buttons for board
for i = 3:-1:1
    for j = 1:3
        grid = uipanel('Parent', board, ...
            'Position', [.025*i+.3*(i-1) .025*j+.3*(j-1) 0.3 0.3]);
        button{abs(j-4),i} = uicontrol('Parent',grid,'Position',[-1 -1 160 145], ...
            'String',' ','FontSize', 48, 'Units', 'normalized','UserData', ...
            [abs(j-4),i]);
    end
end

% Set callback function for each button
for i = 1:3
    for j = 1:3
        set(button{i,j},'Callback',{@Played,button,trackPlayed})
    end
end
end

function Played(object,~,button,trackPlayed)
% Callback function for buttons

    % Gets position of button
    position = object.UserData;

    % Changes trackPlayed board to 1 where user played
    row = position(1);
    column = position(2);
    global trackPlayed
    trackPlayed(row, column) = 1;

    % Put 'X' on board and turn off button
    set(button{row,column},'Enable','off','String','X')

    % Check for win
    win = checkWin(trackPlayed);

    % disable buttons if there is a win and display win message
    if win == true
        for i = 1:3
            for j = 1:3
                set(button{i,j},'Enable','off')
            end
        end

        fprintf('Woo hoo! You won!\n')

        % Check to see if the user wants to replay
        replay = input('Would you like to play again? (y/n): ','s');
        replayFunction(replay);
        return;
    end

    % Check for a tie and display tie message
    tie = checkTie(trackPlayed);
    if tie == true
        fprintf('A tie! Better play again...\n')

        % Check to see if the user wants to replay
        replay = input('Would you like to play again? (y/n): ','s');
        replayFunction(replay);
        return;
    end
    
    % Turn off buttons so you can't press while computer is thinking
    for i = 1:3
        for j = 1:3
            set(button{i,j},'Enable','off')
        end
    end
    
    % Pause to make it look like the computer is actually thinking
    pause(1)

    % Generated computer move
    newMove = true;
    computerMove = [randi(3), randi(3)];

    % Check if computerMove has already been played
    while newMove == true
        if abs(trackPlayed(computerMove(1),computerMove(2))) == 1
            newMove = true;
            computerMove = [randi(3), randi(3)];
        else
            newMove = false;
        end
    end 

    % Update trackPlayed board to -1 where computer plays
    trackPlayed(computerMove(1),computerMove(2)) = -1;

    % Put 'O' on board and turn off button
    set(button{computerMove(1),computerMove(2)},'Enable','off','String','O')

    % Turn buttons back on after computer move
    for i = 1:3
        for j = 1:3
            if abs(trackPlayed(i,j)) ~= 1
                set(button{i,j},'Enable','on')
            end
        end
    end

    % Check for a win
    win = checkWin(trackPlayed);

    % disable buttons if there is a win and display win message
    if win == true
        for i = 1:3
            for j = 1:3
                set(button{i,j},'Enable','off')
            end
        end
        fprintf('Bummer... You lost.\n')

        % Check to see if the user wants to replay
        replay = input('Would you like to play again? (y/n): ','s');
        replayFunction(replay);
        return;
    end

    % Check for a tie and display tie message
    tie = checkTie(trackPlayed);
    if tie == true
        fprintf('A tie! Better play again...\n')

        % Check to see if the user wants to replay
        replay = input('Would you like to play again? (y/n): ','s');
        replayFunction(replay);
        return;

    end
end

function winStatus = checkWin(gameBoard)
% Check the board to see if any win conditions are satisfied 
    winStatus = false;

    % Vector of all 8 win conditions
    winConditions = [sum(gameBoard(1,:)),sum(gameBoard(2,:)),sum(gameBoard(3,:)),...
        sum(gameBoard(:,1)),sum(gameBoard(:,2)),sum(gameBoard(:,3)),trace(gameBoard),...
        (gameBoard(3,1)+gameBoard(2,2)+gameBoard(1,3))];
    
    %Checking vector for wins
    for i = 1:8
        if abs(winConditions(i)) == 3
            winStatus = true;
            break
        else
            winStatus = false;
        end
    end
end

function tieStatus = checkTie(gameBoard)
% Check the board to see if there was a tie
    tieStatus = false;
    if abs(gameBoard) == ones(3)
        tieStatus = true;
    else
        tieStatus = false;
    end
end

function replayFunction(userInput)
% function to check in the user wants to replay
    % Cases to user's input (yes/no/invalid response)
    while userInput ~= ('y')
        if userInput == 'n'
            disp('See you next time!');
            return;
        else
            userInput = input('Invalid response. Enter y or n: ','s');
        end
    end
    
    % Play game if user input is 'y'
    playGame
end


