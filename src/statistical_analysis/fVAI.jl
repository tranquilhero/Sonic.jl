# File: fVAI.jl
# Author:
# Date: 29-June-2020

# VALUE ADDED INDEX (VAI)
function fVAI(x)

# --------------------------------------------------------------------------
# x:       returns vector
# vaidx:   Value Added Index (VAI)
# --------------------------------------------------------------------------

    n = size(x,1); # data points
    fVAI = ones(1,n); # pre-allocate memory()
    fVAI(1) = 100; # initialise to $100
    for i = 1:i:end
        fVAI(i+1) = fVAI(i) * (1+x[i]./100); # calculate VAI
    end
    vaidx = fVAI;
    return vaidx
end
