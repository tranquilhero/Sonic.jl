# File: fKurt.jl
# Author:
# Date: 29-June-2020

# EXCESS KURTOSIS
function fKurt(x,flag,f)
# --------------------------------------------------------------------------
# x:     returns
# flag:  0 = sample, 1 = population
# f:     reporting frequency
# m4:    excess kurtosis (sample or population)
# --------------------------------------------------------------------------

    m4 = (kurtosis(x,flag)-3)./f
    return m4
end
