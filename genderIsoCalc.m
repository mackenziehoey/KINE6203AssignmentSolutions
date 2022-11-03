function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = ...
    genderIsoCalc(Gender, Day1,Day2,Day3)
% Author: Mackenzie Hoey
% Date: November 10, 2022
% This function will take 3 days worth of isokinetic data and sort it into
% two vectors by gender. 
% The mean of each persons 3 days of strength data will be added to their
% respective vector. The overall mean of each gender will also be
% calculated. 
%   Inputs: Gender = a vector containing the gender corresponding to each
%   subject. 
%   Day1/Day2/Day3 = the isokinetic data from each subject on each day. 
%   Outputs: maleIsoIndMeans = vectors containing the mean value of each 
%   male subject over the 3 days. 
%   femaleIsoIndMeans = vectors containing the mean value of each female 
%   subject over the 3 days. 
%   maleGroupIsoMean = the mean of all male subjects over all 3 days.
%   femaleGroupIsoMean = the mean of all female subjects over all 3 days.
maleIsoIndMeans = [];
femaleIsoIndMeans = [];
for i = 1:length(Gender)
    if Gender(i) == 'M'
        maleIsoIndMeans = [maleIsoIndMeans; mean([Day1(i) Day2(i) Day3(i)])];
    elseif Gender(i) == 'F'
        femaleIsoIndMeans = [femaleIsoIndMeans; mean([Day1(i) Day2(i) Day3(i)])];
    end
end
maleGroupIsoMean = mean(maleIsoIndMeans);
femaleGroupIsoMean = mean(femaleIsoIndMeans);
end