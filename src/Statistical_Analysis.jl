print("Statistical_Analysis.jl here")

# Value Added Index
function fVAI(x)
    n = size(x,1); # data points
    fVAI = ones(1,n); # pre-allocate memory()
    for i in 1:n
        fVAI(i) += fVAI(i) * (1+x[i]./100); # calculate VAI
    end
    vaidx = fVAI;
    return vaidx
end

# GET XL DATA
function getXLData(fname,sname)
    # raw data
    rawdata = XLSX.readxlsx(fname)
    # labels
    names = rawdata(1,:);
    names(1) = [];
    # dates
    dates = rawdata(2:end,1);
    # returns
    rwdata(:,1) = [];
    returns = rawdata(2:end,:);
    ##
    #returns = cell2mat(returns);
end

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
