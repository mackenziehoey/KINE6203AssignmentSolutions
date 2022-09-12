% Author: Mackenzie Hoey
% Date: October 6, 2022
% 
% The following code prompts the user to play a game of 
% tic tac toe with the computer.
% 

% Welcome screen asking user if they want to play.
disp('Welcome to tic tac toe. Would you like to play a game?');
userAnswer = input('Enter y/n: ', 's');

% Cases to user's input (yes/no/invalid response).
if userAnswer == 'y'
    playingGame = true;
    firstPlay = input(['For you to go first enter 1. ' ...
        'For the computer to go first enter 2: ']);
elseif userAnswer == 'n'
    disp('See you next time');
else
    disp('Invalid response. Restart game and enter y or n.');
end

%Creates the game grid
fig = figure('NumberTitle', 'off', 'Name', 'Game');
board = uipanel(fig, 'Title','Tic Tac Toe', ...
               'BackgroundColor', 'white',...
             'Position',[.01 .01 .98 .98]);

movesPlayed = uicontrol('Style','text','Visible','off','UserData', zeros(3,3));

for i = 1:3
    for j = 1:3
        grid = uipanel('Parent', board, ...
            'Position', [.025*i+.3*(i-1) .025*j+.3*(j-1) 0.3 0.3]);
        button = uicontrol('Parent',grid,'Position',[-1 -1 160 145], ...
            'String',' ','FontSize', 48, 'Units', 'normalized','UserData', ...
            [i,j]);
    end
end

for i = 1:3
    for j = 1:3
        set(grid,'Callbabck',{@Played, grid, movesPlayed})
    end
end

function Played(object,~,grid,movesPlayed)
object.UserData
movesPlayed.UserData
end 

% if firstPlay == 1
%     x = 2;
% else
%     move = [rand(1,3), rand(1,3)];
% end

