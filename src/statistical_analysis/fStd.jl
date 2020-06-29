#File: fStd.jl
#Author:
#Date: 29-June-2020

#STANDARD DEVIATION
function fStd(x,flag,f)
#--------------------------------------------------------------------------
#x:     returns
#flag:  0 = sample, 1 = population
#f:     reporting frequency
#m2:    standard deviation (sample or population)
#--------------------------------------------------------------------------

    m2 = std(x,flag).*sqrt(f)
    return m2
end
