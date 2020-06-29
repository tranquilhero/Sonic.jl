# File: barchart.jl
# Author:
# Date: 29-June-2020

function barchart()
    # import XL data
    [~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    n = size(returns,1); # # data points

    figure; # create figure
    sDate = datenum(dates(1)); # set start date for x-axis
    eDate = datenum(dates(end)); # set end date for x-axis
    xData = linspace(sDate,eDate,n);

    bar(xData, returns); # plot bar chart
    xlabel('Date'); # add x label
    ylabel('RoR (# )'); # add y label
    box off;
    ytick = get(gca,'YTick'); # format axes
    set(gca,'YTickLabel', sprintf('# .2f|',ytick))
    datetick('x','yyyy','keeplimits');
    return bar
end
