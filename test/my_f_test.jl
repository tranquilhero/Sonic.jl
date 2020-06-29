my_f(2,1)
my_f(2,3)

derivate_of_my_f(2,1)

@testset "Sonic.jl" begin
    @test my_f(2, 1) == 7
    @test my_f(2, 3) == 31
end

@testset "Derivative Tests" begin
    @test derivate_of_my_f(2, 1) == 2
end
