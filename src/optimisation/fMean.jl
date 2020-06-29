#File: fMean.jl
#Author:
#Date: 29-June-2020

#MEAN
function fMean(x,f)
#-------------------------------------------------------------------
#x:     returns vector
#f:     reporting frequency e.g. 12 (monthly)
#mn:    annualised mean
#-------------------------------------------------------------------

    fMean = mean(x).*f;
    mn = fMean;
    return mn
end
