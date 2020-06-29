# File: histogram.jl
# Author:
# Date: 29-June-2020

function histogram()
    # import XL file
    [dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    mn = abs(min(returns)); # get min percent absolute
    mx = abs(max(returns)); # get max percent absolute

    figure; # create figure
    y=returns; # set returns to y

    x=-4.5:0.25:4.5;  # bins -4.5 to 4.5 intervals 0.25
    freq = histc(y,x);  # count frequency per bin
    freq = y.count(x);
    rfreq = (freq/sum(freq))*100; # relative frequency

    bar(x,rfreq);  # plot bar chart
    xlabel('Bin'); # add x label
    ylabel('Rel. Freq. (# )'); # add y label
end
