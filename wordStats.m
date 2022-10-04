function [length, firstChar, lastChar] = wordStats(word)
%  Takes a string value as input and returns the length of the
%  string and the first and last character
length = strlength(word);
firstChar = word(1);
lastChar = word(length);
end