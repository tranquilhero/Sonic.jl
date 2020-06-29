# File: fSkew.jl
# Author:
# Date: 29-June-2020

# SKEW
function m3 = fSkew(x,flag,f)
# --------------------------------------------------------------------------
# x:     returns
# flag:  0 = sample, 1 = population
# f:     reporting frequency
# m3:    skew (sample or population)
# --------------------------------------------------------------------------

    m3 = skewness(x,flag)./sqrt(f);
end
