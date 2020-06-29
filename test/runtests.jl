using SafeTestsets
@safetestset "My f tests" begin include("my_f_test.jl") end
@safetestset "fVAI() tests" begin include("fVAI_test.jl") end
