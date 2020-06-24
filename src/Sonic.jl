module Sonic

# Write your package code here.
using Reexport
@reexport using Distributions
@reexport using DataStructures

using LinearAlgebra
using ForwardDiff
export x, y

x() = "x"
y() = "y"
p() = "p"

include("The_Hedge_Fund_Industry.jl")
include("Statistical_Analysis.jl")
include("my_f.jl")

export my_f, derivate_of_my_f
export my_f1

end # module
