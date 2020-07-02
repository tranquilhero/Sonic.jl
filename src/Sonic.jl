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

#Classification
export my_f, derivate_of_my_f

export my_f1
export fVAI, getXLData
#Performance Measurement
export VAMI #diversified managed futures
export Risk-Adjusted Returns
export 
export 
# Hedge Fund Classification
export dendrogram
export 
# Market Risk Management
export VaR,  # Value at Risk 
export MVaR, # Modified Value at Risk
export ES,   # Expected Shortfall
export EVT,  # Extreme Value Theory
export BM,   # Block Maxima
export POT,  # Peaks Over Threshold

end # module
