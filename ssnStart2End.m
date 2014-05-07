
prevTime = -1;
index = 1;
context(1,1) = -1;
timeDiff = 1 * 60 * 60 * 1000;
count = 0;
for i = 1 : length(datesUnix)
    if( (datesUnix(i) - prevTime) > timeDiff )
        context(index, 2) = prevTime;
        context(index,3) = count;
        context(index,4) = int64((context(index,2) - context(index,1)) /(1000 * 60)); % in minutes ..session time
        
        
        count = 0;
        index = index + 1;
        context(index, 1) = datesUnix(i);
        
        
    end
    count = count + 1;
    prevTime = datesUnix(i);
end
context(index, 2) = datesUnix(i);



for i = 2 : length(context)
    contextStr{i,1} = datestr(dateUnix2Str(context(i,1)));
    contextStr{i,2} = datestr(dateUnix2Str(context(i,2)));
end
