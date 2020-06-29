# File: fMean.jl
# Author:
# Date: 29-June-2020

# MEAN
function fMean(x,f)
# -------------------------------------------------------------------
# x:     returns
# f:     reporting frequency
# m1:    mean
# -------------------------------------------------------------------

    m1 = mean(x).*f
    return m1
end
