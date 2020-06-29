# File: fJBTest.jl
# Author:
# Date: 29-June-2020

# JARQUE-BERA TEST FOR NORMALITY
function fJBTest(x,sig,dof)
# -------------------------------------------------------------------
# x:         returns vector
# sig        significance level e.g. 95#  (0.95)
# dof        degrees of freedom e.g. 2
# jb:        Jarque-Bera value
# critval    inverse Chi-square at required significance level
# pval       Chi-square at Jarque-Bera value
# -------------------------------------------------------------------

    n = size(x,1); # # data points
    S = skewness(x,0); # sample skew
    K = kurtosis(x,0)-3; # sample excess kurtosis
    jb = (n/6)*(S^2+(K^2/4)); # Jarque-Bera value
    critval = chi2inv(sig,dof); # inverse Chi-square value
    pval = chi2pdf(jb,dof); # Chi-square at Jarque-Bera value

    return [jb, critval, pval] 
end
