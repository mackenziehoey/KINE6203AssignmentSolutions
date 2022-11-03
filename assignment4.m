% Mackenzie Hoey
% November 10, 2022
% Assignment 4

% Import csv file of isokinetic data and save each column as a variable
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv');

% Use genderIsoCalc function to get a vector of male mean isokinetic
% numbers from days 1-3, female mean isokinetic numbers from days 1-3, male
% group means from all days and female group means from all days
[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = ...
    genderIsoCalc(Gender,Day1,Day2,Day3);

% Use dayComparer to return which subjects had an increase in strength from
% day 1 to day 2
day1toDay2 = dayComparer(SubjectID,Day1,Day2);

% Use dayComparer to return which subjects had an increase in strength from
% day 2 to day 3
day2toDay3 = dayComparer(SubjectID,Day2,Day3);

% Use normalizeWeight to return the mean isokinetic data normalized to
% weight for the whole group
normDay1mean = normalizeWeight(Weight,Day1);
normDay2mean = normalizeWeight(Weight,Day2);
normDay3mean = normalizeWeight(Weight,Day3);

% Find which result has the longest vector and create an array with 
% that many rows and 9 columns 
size = max([length(maleIsoIndMeans) length(femaleIsoIndMeans) ...
    length(day1toDay2) length(day2toDay3)]);
results_array = cell(size,9);

% Add maleIsoIndMeans to the final results array
for i = 1:length(maleIsoIndMeans)
    results_array{i,1} = maleIsoIndMeans(i);
end

% Add maleIsoIndMeans final results array
for i = 1:length(femaleIsoIndMeans)
    results_array{i,2} = femaleIsoIndMeans(i);
end

% Add maleGroupIsoMean, femaleGroupIsoMean, normDay1mean, normDay2mean, and
% normDay3mean to the final results array
results_array{1,3} = maleGroupIsoMean;
results_array{1,4} = femaleGroupIsoMean;
results_array{1,7} = normDay1mean;
results_array{1,8} = normDay2mean;
results_array{1,9} = normDay3mean;

% Add day1toDay2 final results array
for i = 1:length(day1toDay2)
    results_array{i,5} = day1toDay2(i);
end

% Add day2toDay3 final results array
for i = 1:length(day2toDay3)
    results_array{i,6} = day2toDay3(i);
end

% Turn the final results array into a table, rename the headers, and write
% it to 'iso_results.csv'
results_table = array2table(results_array);
table_headers = {'maleMeans','femaleMeans','maleGroupMean','femaleGroupMean',...
    'day1toDay2','day2toDay3','normDay1mean','normDay2mean','normDay3mean'};
results_table = renamevars(results_table,1:9,table_headers);
writetable(results_table,'iso_results.csv');

