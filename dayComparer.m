function [subjectsWithIncrease] = dayComparer(subjectID,day1,day2)
% Author: Mackenzie Hoey
% Date: November 10, 2022
% This function takes a vector of subject IDs and two days of isokinetic
% strength data and returns a vector of the subjects that had an increase
% in strength from the first to second day. 
%   Inputs: subjectID = a vector will each individuals subject ID.
%   day1 = a vector with the first day of isokinetic strength data.
%   day2 = a vector with the second day of isokinetic strength data.
%   Output: subjectsWithIncrease = a vector with all of the subject IDs of
%   individuals who increased in strength from day 1 to day 2.
subjectsWithIncrease = [];
for i = 1:length(subjectID)
    if (day2(i)-day1(i)) > 0
        subjectsWithIncrease = [subjectsWithIncrease; subjectID(i)];
    end
end
end