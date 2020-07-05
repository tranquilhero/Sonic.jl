module Sonic

using Reexport

@reexport using Statistical_Analysis
@reexport using Optimisation
@reexport using Performance_measurement
@reexport using Classification
@reexport using Market_risk

include("The_Hedge_Fund_Industry.jl")
using LinearAlgebra
using DataStructures
using Distributions
using ForwardDiff
using Plots

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
