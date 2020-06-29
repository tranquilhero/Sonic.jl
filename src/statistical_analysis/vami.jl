# File: vami.jl
# Author:
# Date: 29-June-2020

function vami()
    # import XL data
    [~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    n = size(returns,1); # data points
    y = fVAI(returns); get VAMI values

    figure; #create figure
    sDate = datenum(dates(1)); #set start date for x-axis
    eDate = datenum(dates(end)); #set end date for x-axis
    xData = linspace(sDate,eDate,n);

    plot(xData,y); #plot line chart
    xlabel('Date'); #add x label
    ylabel('VAMI ($)'); #add y label
    box off;
    ytick = get(gca,'YTick'); #format axes
    set(gca,'YTickLabel', sprintf('.2f|',ytick))
    datetick('x','yyyy','keeplimits');
    annotation('textarrow',[.845,.845],[.7,.85],'String','$182.20'); add arrow & text

    row & text

     & text

    row & text

end
