#File: maxSharpe.jl
#Author:
#Date: 29-June-2020

#OBJECTIVE FUNCTION: MAXIMISE Sharpe Ratio
function maxSharpe(W,R,rf,VCV)
###########################################################################
#INPUTS:
#R     - returns vector
#rf    - risk-free rate
#VCV   - VCV matrix
###########################################################################
    R = R-rf;
    fval = -W'*R/sqrt(W'*VCV*W);
    return fval
end
