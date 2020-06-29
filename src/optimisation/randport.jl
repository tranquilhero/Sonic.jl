# File: randport.jl
# Author:
# Date: 29-June-2020

# import XL data
[names,~,returns] = getXLData('hfma_matlab_data','10 Hedge Funds');

N = size(returns,2); # # data points
am1 = fMean(returns,1); # monthly mean
covar = cov(returns); # covariance matrix

# plot mean-variance efficient frontier
portopt(am1,covar,N)

# randomise asset weights (1,000)
w = exprnd(1,1000,N);
tot = sum(w,2);
tot = tot(:,ones(N,1));
w = w./tot;

# calculate exp. return & std. dev. for each portfolio
[pRisk , pRet] = portstats(am1,covar,w);

# plot random portfolios
hold on
plot(pRisk,pRet,'.r');
hold off
