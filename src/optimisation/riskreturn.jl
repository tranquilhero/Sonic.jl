# File: riskreturn.jl
# Author:
# Date: 29-June-2020

# import XL data
[names,~,returns] = getXLData('hfma_matlab_data','10 Hedge Funds');

am1 = fMean(returns,12); # annual mean
am2 = fStd(returns,0,12); # annual std. dev.

# settings for scatter plot
scatter(am2,am1,'b*')
xlabel('Risk (# )');
ylabel('Return (# )');
