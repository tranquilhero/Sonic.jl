# File: getXLData.jl
# Author:
# Date: 29-June-2020
using XLSX
# GET XL DATA
function getXLData(fname::AbstractString, sname::AbstractString)
    # raw data
    rwdata = xlsread(fname,sname);
    # labels
    names = rwdata(1::)
    names(1) = [];
    # dates
    dates = rwdata(2:1:)
    # returns
    rwdata(:,1) = [];
    returns = rwdata(2::);
    returns = cell2mat(returns);
end
