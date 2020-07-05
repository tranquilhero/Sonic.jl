module Sonic

# Write your package code here.
using Reexport
@reexport using Distributions
@reexport using DataStructures

using LinearAlgebra
using ForwardDiff
using Plots

include("The_Hedge_Fund_Industry.jl")
include("Statistical_Analysis.jl")
include("Optimisation.jl")
include("Performance_measurement.jl")
include("Classification.jl")
include("Market_risk.jl")

# Statistical Analysis
export VAI # Value Added Index
export m1  # MEAN
export m2  # standard deviation
export m3  # Skew
export m4  # Kurtosis
# COVARIANCE AND CORRELATION
export R2  # coefficient of determination = the square of the correlation
# A residual plot
export SE  # standard error
export JBTest  #Jarque-Bera Test

#  Mean-Variance Optimisation
export minVar # MININIMISE VARIANCE

# Bound Constraints 
# Linear Equality Constraints
# Sharpe Ratio Maximisation


#Classification
export my_f, derivate_of_my_f

export my_f1
export fVAI, getXLData
#Performance Measurement
export VAMI #diversified managed futures
export Risk-Adjusted Returns


# Hedge Fund Classification
export dendrogram
 
# Market Risk Management
export VaR,  # Value at Risk 
export MVaR, # Modified Value at Risk
export ES,   # Expected Shortfall
export EVT,  # Extreme Value Theory
export BM,   # Block Maxima
export POT,  # Peaks Over Threshold

end # module
