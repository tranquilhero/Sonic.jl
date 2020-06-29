#File: efficfron.jl
#Author:
#Date: 29-Jan-2020

#import XL data
[names,~,returns] = getXLData('hfma_matlab_data','10 Hedge Funds');

N = size(returns,2); ## data points
am1 = fMean(returns,1); #monthly mean
covar = cov(returns); #covariance matrix

#plot mean-variance efficient frontier
portopt(am1,covar,N)
