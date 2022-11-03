function [normDayMean] = normalizeWeight(weight,day)
% Author: Mackenzie Hoey
% Date: November 10, 2022
% This function takes in one day worth of isokinetic strength data and
% and normalizes it to the subjects weight. It then takes the values
% from all subjects and takes the mean of the whole group's normalized
% strength data.
%   Inputs: weight = a vector of each subjects weight.
%   day = a vector of the isokinetic strength data from each subject.
%   Output: normDayMean = the mean of all the isokinetic strength data
%   normalized to weight
normDayMean = [];
for i = 1:length(weight)
    normDayMean = [normDayMean; day(i)/weight(i)];
end
normDayMean = mean(normDayMean);
end