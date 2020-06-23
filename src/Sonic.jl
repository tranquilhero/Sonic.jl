module Sonic

# Write your package code here.
using ForwardDiff
export x, y

x() = "x"
y() = "y"
p() = "p"

include("The_Hedge_Fund_Industry.jl")
include("my_f.jl")

export my_f, derivate_of_my_f
export my_f1

   # module
end
