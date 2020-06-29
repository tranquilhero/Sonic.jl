#File: minVar.jl
#Author:
#Date: 29-June-2020

#OBJECTIVE FUNCTION: MININIMISE VARIANCE
function minVar(W,VCV)
###########################################################################
#INPUTS:
#W      - weight vector
#VCV    - VCV matrix
###########################################################################

    fval = W'*VCV*W;
    return fval
end
