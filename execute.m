% load data using import Data..... in variables urls, datesUnix, ids 
% in datafile browser.csv.... replaced ',' in urls with (comma)

%dates=cell(length(datesUnix),1);
%size(dates)
clear;
load('../data/BrowserData.mat');
pattern = '[//]*//[^/]*';
for i = 1 : length(datesUnix)
    %dates{i} = num2cell(loadData(datesUnix(i)));
    dates{i,:} = dateUnix2Str(datesUnix(i));
    temp = regexp(urls(i), pattern, 'match');
    urlsTrunc(i,:) = temp{1}(1);
end
ides = num2cell(1 : length(datesUnix))';
data = [ides dates urlsTrunc urls];

urlsUniq = unique(urlsTrunc);

%dataSortDates = sortrows(data,2);
%dataSortUrls = sortrows(data,2);
ssnStart2End
