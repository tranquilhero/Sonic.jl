using Main.Sonic
using Test

my_f(2,1)
my_f(2,3)
my_f1(2,1)
my_f1(2,3)

@testset "Sonic.jl" begin
    @test my_f(2, 1) == 7
    @test my_f(2, 1) == 72
    @test my_f(2, 3) == 31

    @test my_f1(2, 1) == 7
    @test my_f1(2, 3) == 13
end
