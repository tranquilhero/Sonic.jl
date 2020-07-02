#  File: combined.jl
#  Author: www.erinzuun.com
#  Date: 21-Jun-2020

function barchart()
    #  import XL data
    [~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    n = size(returns,1); #  #  data points

    figure; #  create figure
    sDate = datenum(dates(1)); #  set start date for x-axis
    eDate = datenum(dates(end)); #  set end date for x-axis
    xData = linspace(sDate,eDate,n);

    bar(xData, returns); #  plot bar chart
    xlabel('Date'); #  add x label
    ylabel('RoR (#  )'); #  add y label
    box off;
    ytick = get(gca,'YTick'); #  format axes
    set(gca,'YTickLabel', sprintf('#  .2f|',ytick))
    datetick('x','yyyy','keeplimits');
    return bar
end

using StatsBase, StatsPlots, Distributions

function histogram()
    # import XL file
    [dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    mn = abs(min(returns)); #  get min percent absolute
    mx = abs(max(returns)); #  get max percent absolute

    figure; #  create figure
    y=returns; #  set returns to y

    x=-4.5:0.25:4.5;  #  bins -4.5 to 4.5 intervals 0.25
    freq = histc(y,x);  #  count frequency per bin
    freq = y.count(x);
    rfreq = (freq/sum(freq))*100; #  relative frequency

    bar(x,rfreq);  #  plot bar chart
    xlabel('Bin'); #  add x label
    ylabel('Rel. Freq. (#  )'); #  add y label
end

function barchart()
    #  import XL data
    [~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

    n = size(returns,1); #  #  data points

    figure; #  create figure
    sDate = datenum(dates(1)); #  set start date for x-axis
    eDate = datenum(dates(end)); #  set end date for x-axis
    xData = linspace(sDate,eDate,n);

    bar(xData, returns); #  plot bar chart
    xlabel('Date'); #  add x label
    ylabel('RoR (#  )'); #  add y label
    box off;
    ytick = get(gca,'YTick'); #  format axes
    set(gca,'YTickLabel', sprintf('#  .2f|',ytick))
    datetick('x','yyyy','keeplimits');
end

#  EXCESS KURTOSIS
function fKurt(x,flag,f)
#  --------------------------------------------------------------------------
#  x:     returns
#  flag:  0 = sample, 1 = population
#  f:     reporting frequency
#  m4:    excess kurtosis (sample or population)
#  --------------------------------------------------------------------------

    m4 = (kurtosis(x,flag)-3)./f
    return m4
end

#  MEAN
function fMean(x,f)
#  -------------------------------------------------------------------
#  x:     returns
#  f:     reporting frequency
#  m1:    mean
#  -------------------------------------------------------------------

    m1 = mean(x).*f
    return m1
end

# STANDARD DEVIATION
function fStd(x,flag,f)
# --------------------------------------------------------------------------
# x:     returns
# flag:  0 = sample, 1 = population
# f:     reporting frequency
# m2:    standard deviation (sample or population)
# --------------------------------------------------------------------------

    m2 = std(x,flag).*sqrt(f)
    return m2
end

#  VALUE ADDED INDEX (VAI)
function fVAI(x)

#  --------------------------------------------------------------------------
#  x:       returns vector
#  vaidx:   Value Added Index (VAI)
#  --------------------------------------------------------------------------

    n = size(x,1); #  data points
    fVAI = ones(1,n); #  pre-allocate memory()
    fVAI(1) = 100; #  initialise to $100
    for i in 1:n
        fVAI(i+1) = fVAI(i) * (1+x[i]./100); #  calculate VAI
    end
    vaidx = fVAI;
    return vaidx
end

#  GET XL DATA
function getXLData(fname,sname)
    #  raw data
    rawdata = XLSX.readxlsx(fname)
    #  labels
    names = rawdata(1,:);
    names(1) = [];
    #  dates
    dates = rawdata(2:end,1);
    #  returns
    rwdata(:,1) = [];
    returns = rawdata(2:end,:);
    # #
    # returns = cell2mat(returns);
end



#  import XL data
[~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

figure; # create figure
y=returns; # set returns to y

x=-4.5:0.25:4.5; # bins -4.5 to 4.5 intervals 0.25
freq = histc(y,x); # count frequency per bin
rfreq = (freq/sum(freq))*100; # relative frequency
nfreq=normpdf(x); # standard normal frequency per bin
rnfreq = (nfreq/sum(nfreq))*100; # relative normal frequency

bar(x,rfreq); # plot chart combination
hold on;
plot(x,rnfreq,'r');
hold off;
xlabel('Bin'); # add x label
ylabel('Rel. Freq. (# )'); # add y label
