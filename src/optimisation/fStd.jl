#File: fStd.jl
#Author:
#Date: 29-June-2020

#STANDARD DEVIATION
function fStd(x,flag,f)
#--------------------------------------------------------------------------
#x:     returns vector
#flag:  0 = sample, 1 = population
#f:     reporting frequency e.g. 12 (monthly)
#sd:    standard deviation (sample or population)
#--------------------------------------------------------------------------

    fStd = std(x,flag).*sqrt(f);
    sd = fStd;
    return sd
end
