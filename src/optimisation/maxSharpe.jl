#File: maxSharpe.jl
#Author: 
#Date: 29-Jan-2014

#OBJECTIVE FUNCTION: MAXIMISE Sharpe Ratio 
function fval = maxSharpe(W,R,rf,VCV)
###########################################################################
#INPUTS:
#R     - returns vector
#rf    - risk-free rate
#VCV   - VCV matrix
###########################################################################
    R = R-rf;
    fval = -W'*R/sqrt(W'*VCV*W);
end





